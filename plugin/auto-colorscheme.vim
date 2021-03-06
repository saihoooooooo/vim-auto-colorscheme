" auto-colorscheme - Automatically change the colorscheme.
" Version: 0.0.4
" Author : saihoooooooo <saihoooooooo@gmail.com>
" License: So-called MIT/X license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

if exists('g:loaded_auto_colorscheme')
    finish
endif
let g:loaded_auto_colorscheme = 1
let s:save_cpo = &cpo
set cpo&vim

if !exists('g:auto_colorscheme_default')
    let g:auto_colorscheme_default = 'default'
endif

if !exists('g:auto_colorscheme_config')
    let g:auto_colorscheme_config = []
endif

function! s:SwitchColorscheme()
    let color = g:auto_colorscheme_default
    for item in g:auto_colorscheme_config
        if expand('%:p') =~ item[0] || expand('%:p:~') =~ item[0]
            let color = item[1]
            break
        endif
    endfor
    if !exists('g:colors_name') || color != g:colors_name
        execute 'colorscheme' color
    endif
endfunction

autocmd BufEnter,WinEnter * nested call s:SwitchColorscheme()

let &cpo = s:save_cpo
unlet s:save_cpo
