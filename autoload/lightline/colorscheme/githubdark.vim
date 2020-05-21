" vim:foldmethod=marker:foldlevel=0:foldenable:

" Description: GitHub colorscheme for Lightline (itchyny/lightline.vim)
" Author: Cormac Relf <web@cormacrelf.net>,
"         Jason Miller <contact@jasonmiller>
" Source: Originally adapted from http//github.com/morhetz/gruvbox
" -----------------------------------------------------------------------------

" {{{ color getter fns
func! s:getGHColor(group)
    let guiColor = synIDattr(hlID(a:group), "fg", "gui")
    let termColor = synIDattr(hlID(a:group), "fg", "cterm")
    return [ guiColor, termColor ]
endfunc
"}}}

func! lightline#colorscheme#githubdark#compute()
    if exists('g:lightline')
        " import colors from scheme {{{
        let s:background = s:getGHColor('ghBackground') 
        let s:base0      = s:getGHColor('ghBase0')
        let s:base1      = s:getGHColor('ghBase1')
        let s:base3      = s:getGHColor('ghBase3')
        let s:base4      = s:getGHColor('ghBase4')
        let s:base5      = s:getGHColor('ghBase5')
        let s:red        = s:getGHColor('ghRed')
        let s:blue       = s:getGHColor('ghBlue')
        let s:yellow     = s:getGHColor('ghYellow')
        let s:orange     = s:getGHColor('ghOrange')
        let s:darkred    = s:getGHColor('ghDarkRed')
        let s:darkpurple = s:getGHColor('ghDarkPurple')
        " }}}

        let s:flatten = [ s:base1, s:base4 ]
        let s:below = [ s:base1, s:base4 ]

        let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}
        let s:p.normal.left = [ [ s:base0, s:base3, 'bold' ], s:flatten ]
        let s:p.normal.right = [ [ s:base0, s:base3 ], s:flatten ]
        let s:p.normal.middle = [ s:below ]
        let s:p.inactive.right = [ [ s:base1, s:base3 ], [ s:base1, s:base3 ] ]
        let s:p.inactive.left =  [ [ s:base1, s:base3 ], [ s:base1, s:base3 ] ]
        let s:p.inactive.middle = [ [ s:base1, s:base3 ] ]
        let s:p.insert.left = [ [ s:base0, s:blue, 'bold' ], s:flatten ]
        let s:p.insert.right = [ [ s:base0, s:blue ], s:flatten ]
        let s:p.insert.middle = [ s:flatten ]
        let s:p.terminal.left = [ [ s:base4, s:base0, 'bold' ], s:flatten ]
        let s:p.terminal.right = [ [ s:base4, s:base0 ], s:flatten ]
        let s:p.terminal.middle = [ s:flatten ]
        let s:p.replace.left = [ [ s:base0, s:darkred, 'bold' ], s:flatten ]
        let s:p.replace.right = [ [ s:base0, s:darkred ], s:flatten ]
        let s:p.replace.middle = [ s:below ]
        let s:p.visual.left = [ [ s:base0, s:darkpurple, 'bold' ], s:flatten ]
        let s:p.visual.right = [ [ s:base0, s:darkpurple ], s:flatten ]
        let s:p.visual.middle = [ s:below ]
        let s:p.tabline.left = [ [ s:base1, s:base5 ] ]
        let s:p.tabline.tabsel = [ [ s:base0, s:base4, 'bold' ] ]
        let s:p.tabline.middle = [ [ s:base0, s:base5 ] ]
        let s:p.tabline.right = [ [ s:base0, s:darkred ] ]
        let s:p.normal.error = [ [ s:red, s:base4 ] ]
        let s:p.normal.warning = [ [ s:yellow, s:base4 ] ]
        return lightline#colorscheme#flatten(s:p)
    endif
    return {}
endfunc

" use g: so it isn't treated as a constant
let g:lightline#colorscheme#githubdark#palette = lightline#colorscheme#githubdark#compute()

