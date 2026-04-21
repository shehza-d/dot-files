# Source - https://stackoverflow.com/a/18948530
# Posted by Kent, modified by community. See post 'Timeline' for change history
# Retrieved 2026-04-07, License - CC BY-SA 4.0

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

