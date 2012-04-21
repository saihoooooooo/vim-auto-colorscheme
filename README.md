vim-auto-colorscheme
====================

Automatically change the color scheme in the regular expression for buffer name.

setup in your vimrc

e.g.)

    let g:auto_colorscheme_default = 'default'
    let g:auto_colorscheme_config = {
    \     '\.vimrc' : 'evening',
    \     '^\\\\win-file-server\\' : 'desert',
    \ }
