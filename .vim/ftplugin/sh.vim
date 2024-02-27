if executable('shellcheck')
    autocmd BufWritePost * !shellcheck --severity=warning <afile>
endif
