" =============================================================================
" based on file:
" Filename: autoload/lightline/colorscheme/wombat.vim
" Author: itchyny
" License: MIT License
" Last Change: 2015/11/30 08:37:43.
" =============================================================================

"*******************************************************************
" to be added in bundle/lightline.vim/autoload/lightline/colorscheme/
"*******************************************************************

"let s:p.{mode}.{where} = [ [ {guifg}, {guibg}, {cuifg}, {cuibg} ], ... ]
"cui and gui diferent kind of user interface (character graphicalç
"graphical seems used in my conf

"darker
let s:base03 = [ '#242424', 235 ]
let s:base023 = [ '#353535 ', 236 ]
let s:base02 = [ '#444444 ', 238 ]
let s:base01 = [ '#585858', 240 ]
let s:base00 = [ '#666666', 242  ]
let s:base0 = [ '#808080', 244 ]
let s:base1 = [ '#969696', 247 ]
let s:base2 = [ '#a8a8a8', 248 ]
let s:base3 = [ '#d0d0d0', 252 ]
"lighter

"original wombat color
" let s:yellow = [ '#cae682', 180 ]
" let s:orange = [ '#e5786d', 173 ]
" let s:red = [ '#e5786d', 203 ]
" let s:magenta = [ '#f2c68a', 216 ]
" let s:blue = [ '#8ac6f2', 17 ]
" let s:green = [ '#95e454', 119 ]

"get color from hybrid
" let s:green = [ "#b5bd68", 200 ]
let s:gui_background = [ "#0E0F10", 128 ]
let s:gui_selection  = [ "#373b41", 128 ]
let s:gui_line       = [ "#282a2e", 128 ]
let s:gui_comment    = [ "#84898e", 128 ]
let s:foreground = [ "#cdd0ce", 128 ]
let s:red        = [ "#cc6666", 128 ]       
let s:orange     = [ "#de935f", 128 ]       
let s:yellow     = [ "#f0c674", 128 ]       
let s:green      = [ "#b5bd68", 128 ]       
let s:aqua       = [ "#8abeb7", 128 ]       
let s:blue       = [ "#81a2be", 128 ]       
let s:purple     = [ "#b294bb", 128 ]       
let s:window     = [ "#303030", 128 ]       
let s:darkcolumn = [ "#1c1c1c", 128 ]       
let s:addbg      = [ "#5F875F", 128 ]       
let s:addfg      = [ "#d7ffaf", 128 ]       
let s:changebg   = [ "#5F5F87", 128 ]       
let s:changefg   = [ "#d7d7ff", 128 ]       
let s:delbg      = [ "#cc6666", 128 ]       
let s:darkblue   = [ "#00005f", 128 ]       
let s:darkcyan   = [ "#005f5f", 128 ]       
let s:darkred    = [ "#5f0000", 128 ]       
let s:darkpurple = [ "#5f005f", 128 ]       
let s:magenta = s:aqua

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

"let s:p.{mode}.{where} = [ [ {guifg}, {guibg}, {cuifg}, {cuibg} ], ... ]

"normal blue
let s:p.normal.left =  [ [ s:base03, s:blue  ], [ s:base3, s:base02 ] ]
let s:p.normal.middle =[ [ s:base03, s:base3 ] ]
let s:p.normal.right = [ [ s:base03, s:blue  ], [ s:base3, s:base02 ] ]

"insert green
let s:p.insert.left =  [ [ s:base03, s:green ], [ s:base3, s:base02 ] ]
let s:p.insert.right = [ [ s:base03, s:green ], [ s:base3, s:base02 ] ]

"visual yellow
let s:p.visual.left =  [ [ s:base03, s:yellow ], [ s:base3, s:base02 ] ]
let s:p.visual.right = [ [ s:base03, s:yellow ], [ s:base3, s:base02 ] ]

"replace red
let s:p.replace.left =  [ [ s:base03, s:red ], [ s:base3, s:base02 ] ]
let s:p.replace.right = [ [ s:base03, s:red ], [ s:base3, s:base02 ] ]

let s:p.inactive.left =  [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base03 ] ]
let s:p.inactive.right = [ [ s:base2, s:base02 ], [ s:base2, s:base023 ]]

"tabline disabled
" let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.left = [ [ s:red, s:red ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base03 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]

" what is it ?
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#custom_style#palette = lightline#colorscheme#flatten(s:p)
