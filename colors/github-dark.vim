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

if !exists("g:github_colors_soft")
  let g:github_colors_soft = 0
endif

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

function! s:Clear(group)
  exec 'highlight clear ' . a:group
endfunction
" }}}
" }}}

" Color dictionary
let s:lib = {}
let s:colors = {}

let s:lib.fafbfc = { 'gui': '#fafbfc', 'cterm': 231 }
let s:lib.d1d5da = { 'gui': '#d1d5da', 'cterm': 188 }
let s:lib.24292e = { 'gui': '#24292e', 'cterm': 235 }
let s:lib.444d56 = { 'gui': '#444d56', 'cterm': 239 }
let s:lib.6a737d = { 'gui': '#6a737d', 'cterm': 243 }
let s:lib.586069 = { 'gui': '#586069', 'cterm': 59  }
let s:lib.2b3036 = { 'gui': '#2b3036', 'cterm': 236 }

" Base colors
let s:colors.base0         = s:lib.fafbfc
let s:colors.base1         = s:lib.d1d5da
let s:colors.base2         = s:lib.586069
let s:colors.base3         = s:lib.444d56
let s:colors.base4         = s:lib.2b3036

if g:github_colors_soft == 0
    let s:colors.bg         = s:lib.24292e
else
    let s:colors.bg         = s:lib.24292e
endif

" User interface colors {{{
call s:Col('Normal', 'base1', 'bg')

" Sign column and line numbers 
call s:Col('LineNr', 'base2', 'bg')
call s:Col('CursorLineNr', 'base1', 'base4')
call s:Col('SignColumn', '', 'bg')
call s:Col('CursorColumn', '', 'base4')

" }}}

