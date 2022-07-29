scriptencoding utf-8

if &cp || exists("g:loaded_zoom")
    finish
endif
let g:loaded_zoom = 1

let s:save_cpo = &cpo
set cpo&vim

" keep default value
let s:current_font = &guifont
let s:current_fontWide = &guifontwide

" font width
let s:fontWidth = substitute(&guifontwide, '^.*:h\([^:]*\).*$', '\1', '')

" command
command! -narg=0 ZoomIn    :call s:ZoomIn()
command! -narg=0 ZoomOut   :call s:ZoomOut()
command! -narg=0 ZoomReset :call s:ZoomReset()
command! -narg=0 Spread    :call s:Spread()
command! -narg=0 Narrow    :call s:Narrow()

" map
nmap = :ZoomIn<CR>
nmap - :ZoomOut<CR>
nmap + :Spread<CR>
nmap _ :Narrow<CR>

" guifont size + 1
function! s:ZoomIn()
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize += 1
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont

  let l:fsizewide = substitute(&guifontwide, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsizewide += 1
  let l:guifontwide = substitute(&guifontwide, ':h\([^:]*\)', ':h' . l:fsizewide, '')
  let &guifontwide = l:guifontwide
endfunction

" guifont size - 1
function! s:ZoomOut()
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize -= 1
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont

  let l:fsizewide = substitute(&guifontwide, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsizewide -= 1
  let l:guifontwide = substitute(&guifontwide, ':h\([^:]*\)', ':h' . l:fsizewide, '')
  let &guifontwide = l:guifontwide
endfunction

" guifont width + 1
function! s:Spread()
  let l:fsize = substitute(&guifont, '^.*:w\([^:]*\).*$', '\1', '')
  let l:fsize += 1
  let l:guifont = substitute(&guifont, ':w\([^:]*\)', ':w' . l:fsize, '')
  let &guifont = l:guifont

  let l:fsizewide = substitute(&guifontwide, '^.*:w\([^:]*\).*$', '\1', '')
  let l:fsizewide += 1
  let l:guifontwide = substitute(&guifontwide, ':w\([^:]*\)', ':w' . l:fsizewide, '')
  let &guifontwide = l:guifontwide
endfunction

" guifont width - 1
function! s:Narrow()
  let l:fsize = substitute(&guifont, '^.*:w\([^:]*\).*$', '\1', '')
  let l:fsize -= 1
  let l:guifont = substitute(&guifont, ':w\([^:]*\)', ':w' . l:fsize, '')
  let &guifont = l:guifont

  let l:fsizewide = substitute(&guifontwide, '^.*:w\([^:]*\).*$', '\1', '')
  let l:fsizewide -= 1
  let l:guifontwide = substitute(&guifontwide, ':w\([^:]*\)', ':w' . l:fsizewide, '')
  let &guifontwide = l:guifontwide
endfunction

" reset guifont size
function! s:ZoomReset()
  let &guifont = s:current_font
  let &guifontWide = s:current_fontWide
endfunction

let &cpo = s:save_cpo
finish

==============================================================================
zoom.vim : 文字サイズコントロールスクリプト
------------------------------------------------------------------------------
$VIMRUNTIMEPATH/plugin/zoom.vim
==============================================================================
author  : 小見 拓
url     : http://nanasi.jp/
email   : mail@nanasi.jp
version : 2009/12/19 16:00:00
==============================================================================
文字のサイズを拡大、縮小するスクリプト。

------------------------------------------------------------------------------
" 文字サイズ拡大
:ZoomIn

" 文字サイズ縮小
:ZoomOut

" 文字幅拡大
:Spread

" 文字幅縮小
:Narrow

" 変更した文字サイズを元に戻す
:ZoomReset


------------------------------------------------------------------------------
他のアプリケーションに合わせて、+、-にマッピングをセットしてあります。

" 文字サイズ拡大
+

" 文字サイズ縮小
-

==============================================================================
vim: set et ft=vim nowrap :
