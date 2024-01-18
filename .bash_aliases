#!/bin/bash

export BUILD_CACHE_ROOT="/import/Engineering/Multiviewer/Builds/MVX/firmware/Jenkins"
export MVX_APP_ROOT="$HOME/dev/mvx-app"
export CURRENT_CARD=172.17.160.82
export CARD_PASSWD=mvx

case $- in
    *i*) ;;
      *) return;;
esac

alias cusr="users | tr ' ' '\n' | uniq -c"

alias ducks="du -cksh * | sort -hr | head -n 15"

alias fcpp="find . -regex '.*\.\(h\|c\|cpp\)'"

alias less="less -R"

alias maked="make -f makefile.docker"

alias xargs="xargs ":

alias fmake="find -type f -name 'makefile*' -o -name '*.mk'"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles_git/ --work-tree=$HOME"

ginc () {
    grep -in -E "#include [<\"]$1[>\"]"
}

mvxd() {
    local DEST_DIR=""
    local ROOT="$MVX_APP_ROOT"

    if [[ "$#" -gt 2 ]]; then
        echo "Usage: mvxd [DEST_MODULE] [MVX_APP_ROOT]"
        return 1
    fi

    if [[ "$#" -eq 0 ]]; then
        cd "$MVX_APP_ROOT" || exit 1
        return 0
    fi

    if [[ "$#" -eq 2 ]]; then
        ROOT="$2"
    fi

    if [[ "$1" = "app" ]]; then
        DEST_DIR="$ROOT"
    else
        DEST_DIR=$(find "$ROOT" -type d -path "*/.git" -prune -o  \
                                        -path "*/build" -prune -o \
                                        -path "*/git_modules/mvx-$1" -print -quit)
    fi

    if [[ "$DEST_DIR" = "" ]]; then
        echo "$1: no matching directory found"
        return 2
    fi

    cd "$DEST_DIR" || exit 1
}

scpc () {
    if [[ $# -eq 1 ]]; then
        sshpass -p "${CARD_PASSWD}" rsync --progress "$1" mvx@"$CURRENT_CARD":/home/mvx
    elif [[ $# -eq 2 ]]; then
        sshpass -p "${CARD_PASSWD}" rsync --progress "$2" mvx@"$1":/home/mvx
    else
        echo "$#"
        echo "usage: scpc [card_id_addr] /path/to/file"
    fi
}

cpbld() {
    if [[ "$#" -ne 3 ]]; then
        echo "usage: cpbld flavour branch id"
        return 1
    fi

    local flavour="$1"
    local branch="$2"
    local release="bionic"
    local id="$3"

    path="$BUILD_CACHE_ROOT"/"$branch"/"$flavour"/"$release"/b"$id"_*.zip
    if [ -f $path ]; then # [ ] expands $path, which we want here...
        scpc $path
    else
        echo "Could not find $path"
        return 1
    fi
}

CSCOPE_DIR="$HOME/.config/cscope"
export CSCOPE_DB="$CSCOPE_DIR/cscope.out"
cscup() {
    if [ ! -d "$CSCOPE_DIR" ]; then
        mkdir -p "$CSCOPE_DIR"
    fi

    find "$MVX_APP_ROOT" -name '*.h' -o -name '*.cpp' >"$CSCOPE_DIR/cscope.files"
    (cd "$CSCOPE_DIR" && cscope -bq -i"$CSCOPE_DIR/cscope.files")
}

dobuild() {
    # Note that we use "$@" to let each command-line parameter expand to a
    # separate word. The quotes around "$@" are essential!
    # We need TEMP as the 'eval set --' would nuke the return value of getopt.
    if TEMP=$(getopt -o 'r::' --long 'restart::' -n 'dobuild' -- "$@"); then
        echo 'Terminating...' >&2
        exit 1
    fi

    # Note the quotes around "$TEMP": they are essential!
    eval set -- "$TEMP"
    unset TEMP

    DORESTART="false"
    RESTART=
    while true; do
        case "$1" in
            '-r'|'--restart')
                DORESTART="true"
                case "$2" in
                    '')
                    ;;
                    *)
                        RESTART="$2"
                    ;;
                esac
                shift 2
                continue
            ;;
            '--')
                shift
                break
            ;;
            *)
                echo 'Internal error!' >&2
                exit 1
            ;;
        esac
    done

    if [[ $# -ne 1 ]]; then
        echo "Please specify a package to build" >&2
        exit 1
    fi

    local DEBNAME="$1"
    echo "building package $DEBNAME..."

    local NEWDEB
    local BASENAME
    make -f "${MVX_APP_ROOT}/makefile.docker" "${DEBNAME}" &&
    NEWDEB=$(ls -t "${MVX_APP_ROOT}"/build/deb/*.deb | head -n 1) &&
    scpc "${NEWDEB}" &&
    BASENAME=$(basename "${NEWDEB}") &&
    _oncard "echo mvx | sudo -S dpkg -i ${BASENAME}; rm ${BASENAME}"

    if [[ "$DORESTART" = "false" ]]; then
        logger -t dobuild "exit w/o restart"
        exit 0
    fi

    if [[ -z "$RESTART" ]]; then
        UNIT="${DEBNAME}"
    else
        UNIT="${RESTART}"
    fi

    if _oncard "echo mvx | sudo -S systemctl restart ${UNIT}"; then
        echo ""
        echo "successfully restarted systemd unit ${UNIT}"
    fi
}

vbg () {
    if [[ $# -ne 1 ]]; then
        echo "usage: vbg background_colour"
        return 1
    fi
    sed -i "s/set background.*$/set background=${1}/pg" ~/.vimrc
}

_oncard() {
    sshpass -p "${CARD_PASSWD}" ssh mvx@"${CURRENT_CARD}" "$1"
}
