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

if !exists("g:github_colors_block_diffmark")
  let g:github_colors_block_diffmark = 0
endif

let colors_name = "githubdark"

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
let s:lib.586069 = { 'gui': '#586069', 'cterm': 59  }
let s:lib.444d56 = { 'gui': '#444d56', 'cterm': 239 }
let s:lib.2b3036 = { 'gui': '#2b3036', 'cterm': 236 }
let s:lib.1b1f23 = { 'gui': '#1b1f23', 'cterm': 234 }

let s:lib.c8e1ff = { 'gui': '#c8e1ff', 'cterm': 189 }
let s:lib.79b8ff = { 'gui': '#79b8ff', 'cterm': 111 }
let s:lib.005cc5 = { 'gui': '#005cc5', 'cterm': 26  }
let s:lib.233c58 = { 'gui': '#233c58', 'cterm': 237 }
let s:lib.1d2d3e = { 'gui': '#1d2d3e', 'cterm': 236 }

let s:lib.ffab70 = { 'gui': '#ffab70', 'cterm': 215 }

let s:lib.f97583 = { 'gui': '#f97583', 'cterm': 210 }
let s:lib.ea4a5a = { 'gui': '#ea4a5a', 'cterm': 167 }
let s:lib.3a2626 = { 'gui': '#3a2626', 'cterm': 236 }

let s:lib.b392f0 = { 'gui': '#b392f0', 'cterm': 141 }
let s:lib.6f42c1 = { 'gui': '#6f42c1', 'cterm': 61  }

let s:lib.85e89d = { 'gui': '#85e89d', 'cterm': 115 }
let s:lib.34d058 = { 'gui': '#34d058', 'cterm': 77  }
let s:lib.28a745 = { 'gui': '#28a745', 'cterm': 35  }
let s:lib.243530 = { 'gui': '#243530', 'cterm': 236 }

let s:lib.24292e = { 'gui': '#24292e', 'cterm': 235 }

let s:lib.e5c07b = { 'gui': '#e5c07b', 'cterm': 180 }
let s:lib.f8d86b = { 'gui': '#f8d86b', 'cterm': 221 }
let s:lib.5e5632 = { 'gui': '#5e5632', 'cterm': 239 }
let s:lib.414030 = { 'gui': '#414030', 'cterm': 237 }

" Base colors, from light to dark
let s:colors.base0          = s:lib.fafbfc
let s:colors.base1          = s:lib.d1d5da
let s:colors.base2          = s:lib.586069
let s:colors.base3          = s:lib.444d56
let s:colors.base4          = s:lib.2b3036
let s:colors.base5          = s:lib.1b1f23

" Github colors
let s:colors.blue0          = s:lib.c8e1ff
let s:colors.blue1          = s:lib.79b8ff
let s:colors.blue2          = s:lib.005cc5
let s:colors.blue3          = s:lib.233c58
let s:colors.blue4          = s:lib.1d2d3e

let s:colors.orange0        = s:lib.ffab70

let s:colors.red0           = s:lib.f97583
let s:colors.red1           = s:lib.ea4a5a
let s:colors.red2           = s:lib.3a2626

let s:colors.green0         = s:lib.85e89d
let s:colors.green1         = s:lib.34d058
let s:colors.green2         = s:lib.28a745
let s:colors.green3         = s:lib.243530

let s:colors.purple0        = s:lib.b392f0
let s:colors.purple1        = s:lib.6f42c1

let s:colors.yellow0        = s:lib.e5c07b
let s:colors.yellow1        = s:lib.f8d86b
let s:colors.yellow2        = s:lib.5e5632
let s:colors.yellow3        = s:lib.414030

if g:github_colors_soft == 0
    let s:colors.bg         = s:lib.24292e
else
    let s:colors.bg         = s:lib.24292e
endif

let s:colors.debug  = { 'gui': '#ff00ff', 'cterm': 201 }

" Named groups
call s:Col('ghBackground', 'bg')
call s:Col('ghBase0', 'base0') 
call s:Col('ghBase1', 'base1') 
call s:Col('ghBase2', 'base2') 
call s:Col('ghBase3', 'base3') 
call s:Col('ghBase4', 'base4') 
call s:Col('ghBase5', 'base5') 
call s:Col('ghGreen', 'green1') 
call s:Col('ghBlue', 'blue2') 
call s:Col('ghBlue2', 'blue2') 
call s:Col('ghBlue3', 'blue2') 
call s:Col('ghBlue4', 'blue2') 
call s:Col('ghDarkBlue', 'debug') 
call s:Col('ghRed', 'red0') 
call s:Col('ghDarkRed', 'red1') 
call s:Col('ghPurple', 'purple0') 
call s:Col('ghDarkPurple', 'purple1') 
call s:Col('ghOrange', 'orange0') 
call s:Col('ghLightOrange', 'debug') 
call s:Col('ghYellow', 'yellow0') 
call s:Col('ghLightRed', 'debug') 
call s:Col('ghOver', 'debug') 

" User interface colors {{{
call s:Col('Normal', 'base0', 'bg')
call s:Col('Cursor', 'bg', 'blue0')
call s:Col('Visual', '', 'blue3')
call s:Col('VisualNOS', '', 'blue2')
call s:Col('Search', '', 'yellow2') | call s:Attr('Search', 'bold')
call s:Col('Whitespace', 'base3', 'bg') 
call s:Col('NonText',    'base3', 'bg') 
call s:Col('SpecialKey', 'base3', 'bg') 

" Sign column, line numbers, cursor column and line
call s:Col('VertSplit', 'base3', 'base3')
call s:Col('LineNr', 'base2', 'bg')
call s:Col('CursorLineNr', 'base1', 'base4')
call s:Col('SignColumn', '', 'bg')
call s:Col('ColorColumn', '', 'base4')
call s:Col('CursorLine', '', 'base4')
call s:Col('CursorColumn', '', 'base4')

" Matching parentheses
call s:Col('MatchParen', 'base0', 'blue2')
call s:Col('Title', 'base1')
call s:Attr('Title', 'bold')

" Popup menu
call s:Col('Pmenu', 'base1', 'base4')
call s:Col('PmenuSel', 'base0', 'blue2') | call s:Attr('PmenuSel', 'bold')
call s:Col('PmenuSbar', '', 'base3')
call s:Col('PmenuThumb', '', 'base1')

" Folds
call s:Col('Folded',     'base1', 'base4')
call s:Col('FoldColumn', 'base2', 'bg')
" }}}

" Syntax highlighting {{{
call s:Clear('Ignore') | call s:Col('Ignore', 'base3', 'bg')
call s:Col('Identifier', 'base0')
call s:Col('PreProc', 'blue1')
call s:Col('Macro', 'blue1')
call s:Col('Define', 'purple0')
call s:Col('Comment', 'base2')
call s:Col('Constant', 'blue1')
call s:Col('String', 'blue0')
call s:Col('Function', 'purple0')
call s:Col('Statement', 'red0')
call s:Col('Type', 'red0')
call s:Col('Todo', 'orange0') | call s:Attr('Todo', 'underline')
call s:Col('Special', 'purple0')
call s:Col('SpecialComment', 'base0')
call s:Col('Label', 'base0')
call s:Col('StorageClass', 'red0')
call s:Col('Structure', 'red0')
" }}}

" GitGutter
if g:github_colors_block_diffmark == 0
  call s:Col('GitGutterAdd',          'green1', 'bg')
  call s:Col('GitGutterChange',       'orange0', 'bg')
  call s:Col('GitGutterDelete',       'red1', 'bg')
  call s:Col('GitGutterChangeDelete', 'orange0', 'bg')
else
  call s:Col('GitGutterAdd',          'base0', 'green2')
  call s:Col('GitGutterChange',       'base0', 'orange0')
  call s:Col('GitGutterDelete',       'base0', 'red1')
  call s:Col('GitGutterChangeDelete', 'base0', 'orange0')
endif

" Syntax highlighting {{{
" Vim
hi link vimHiTerm      ghBlack
hi link vimHiGroup     ghOrange
hi link vimUserFunc    ghPurple
hi link vimCommand     Statement
hi link vimNotFunc     Statement
hi link vimGroup       Statement
hi link vimHighlight   Identifier
hi link vimAutoCmd     Identifier
hi link vimAutoEvent   Identifier
hi link vimSyntax      Identifier
hi link vimSynType     Identifier
hi link vimMap         Identifier
hi link vimOption      Identifier
hi link vimUserCommand Identifier
hi link vimAugroupKey  Identifier

hi link Delimiter         Normal
hi link SpecialComment    Comment
hi link Character         Number
hi link CursorIM          Cursor
hi link cppSTL            Function
hi link cppSTLType        Type
hi link shDeref           Identifier
hi link shVariable        Function
hi link perlSharpBang     Special
hi link schemeFunc        Statement

" TOML
hi link tomlTable ghPurple
hi link tomlKey   ghBlack

" YAML
hi link yamlBlockMappingKey ghGreen

" Rust
hi link rustModPath         Function
hi link rustIdentifier      Function
hi link rustSelf            PreProc
hi link rustDerive          Comment
hi link rustAttribute       Comment 
hi link rustDeriveTrait     Comment
hi link rustModPathSep      Statement
" }}}

" Diff (language)
call s:Col('diffFile',      'base1',    'base4')
call s:Col('diffNewFile',   'base1',    'base4')
call s:Col('diffIndexLine', 'blue0', 'base4')
call s:Col('diffLine',      'blue0', 'blue4')
call s:Col('diffSubname',   'blue0', 'blue4')
call s:Col('diffAdded',     'green0', 'green3')
call s:Col('diffRemoved',   'red0', 'red2')

if has("spell")
  call s:Col('SpellBad', 'red0')
  call s:Attr('SpellBad', 'undercurl')
  call s:Spell('SpellBad', 'red0')
  call s:Col('SpellCap', 'green0')
  call s:Attr('SpellCap', 'undercurl')
  call s:Spell('SpellCap', 'green0')
  call s:Col('SpellLocal', 'purple0')
  call s:Attr('SpellLocal', 'undercurl')
  call s:Spell('SpellLocal', 'yellow0')
  call s:Col('SpellRare', 'purple0')
  call s:Attr('SpellRare', 'undercurl')
  call s:Spell('SpellRare', 'purple0')
endif

