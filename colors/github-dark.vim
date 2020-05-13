" vim: foldenable foldmethod=marker foldlevel=1
" Use `zm` and `zr` to increase or decrease folded sections
" See :help modeline
" Name:         Github Dark
" Description:  Github Dark color scheme for Vim and Neovim
" Author:       Jason Miller <contact@jasonmiller.nl>
" Maintainer:   Jason Miller <contact@jasonmiller.nl>
" License:      Vim License (see `:help license`)
" Note:         Based on https://github.com/cormacrelf/vim-github-colors

" Preamble {{{
hi clear
if exists("syntax_on")
    syntax reset
endif

set background=dark

let colors_name = "github-dark"

" Helper functions {{{
" See https://github.com/whatyouhide/vim-gotham/

function! s:Highlight(args)
  exec 'highlight ' . join(a:args, ' ')
endfunction

function! s:AddGroundValues(accumulator, ground, color)
  let new_list = a:accumulator
  for [where, value] in items(a:color)
    call add(new_list, where . a:ground . '=' . value)
  endfor

  return new_list
endfunction

function! s:Col(group, fg_name, ...)
  " ... = optional bg_name

  let pieces = [a:group]

  if a:fg_name !=# ''
    let pieces = s:AddGroundValues(pieces, 'fg', s:colors[a:fg_name])
  endif

  if a:0 > 0 && a:1 !=# ''
    let pieces = s:AddGroundValues(pieces, 'bg', s:colors[a:1])
  endif

  call s:Clear(a:group)
  call s:Highlight(pieces)
endfunction

function! s:Attr(group, attr)
  let l:attrs = [a:group, 'term=' . a:attr, 'cterm=' . a:attr, 'gui=' . a:attr]
  call s:Highlight(l:attrs)
endfunction

function! s:Spell(group, attr)
  let l:attrs = [a:group, 'guisp=' . s:colors[a:attr].gui ]
  call s:Highlight(l:attrs)
endfunction

" }}}
" }}}

