" auto-colorscheme - Automatically change the colorscheme.
" Version: 0.0.0
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

let s:switch_colorscheme_default = g:colors_name
if exists('g:auto_colorscheme_config')
    let g:auto_colorscheme_config = {}
endif

autocmd MyAutoCmd BufEnter * call s:switchColorscheme()

function! s:switchColorscheme()
    let color = ''
    for [key, value] in items(g:auto_colorscheme_config)
        if @% =~ key
            let color = value
        endif
    endfor
    execute 'colorscheme' color != '' ? color : s:switch_colorscheme_default
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
