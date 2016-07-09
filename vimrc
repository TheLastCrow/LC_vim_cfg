"coloration syntaxique
syntax on

"color background
" set background=dark

"display line number
set number

"show command eg :2dd
set showcmd

"activer souris select/molette
set mouse=a

"surligner recherche
set hlsearch

"color theme
" colo elflord
" colo hybrid
set background=dark
colorscheme hybrid

"tabulation setting
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces


"*********************"
"****** Pathogen *****"
"*********************"
"Pathogen plugin that allow to add other plugin in bundle dir
execute pathogen#infect()

"call pathogen#helptag/s() ” generate helptags for everything in ‘runtimepath’


"********************"
"***** NerdTree *****"
"********************"
"nerdtree plugin to display directory tree

"auto load at start 
autocmd vimenter * NERDTree

"ignore pyc files"
let NERDTreeIgnore=['.pyc$[[file]]', '\~$']

"jump to NerdTree window
map <C-a> :NERDTreeToggle<CR>:NERDTreeToggle<CR>

"open/close NerdTree window
map <C-F9> :NERDTreeToggle<CR>


"*******************"
"***** taglist *****"
"*******************"
"open taglist on the right
let Tlist_Use_Right_Window=1

"jump to TagList window
let Tlist_GainFocus_On_ToggleOpen=1
map <C-e> :TlistToggle<CR>:TlistToggle<CR>

"open/close TagList window
map <C-F10> :TlistToggle<CR>

"close unactivated file tag list tree
let Tlist_File_Fold_Auto_Close=1

"let Tlist_Auto_Open=1
"let Tlist_Enable_Fold_Column=0
"let Tlist_Compact_Format=0
"let Tlist_WinWidth=28
"let Tlist_Exit_OnlyWindow=1
"nmap <LocalLeader>tt :Tlist<cr>

"*********************"
"***** Comentary *****"
"*********************"
"map for commentary
map <S-c>  <Plug>Commentary<Right>

map <C-F5> NERDTree-R<CR>


"***********************"
"***** minibufexpl *****"
"***********************"
"switch previous file
map <C-PageUp> :bp<CR>

"switch next file
map <C-PageDown> :bn<CR>

"Jump to mini buf exp wondow
map <C-z> :MBEFocus<CR>

map <C-r> :%s/

"*****************"
"***** other *****"
"*****************"

"filetype ???
"filetype plugin indent on
filetype plugin on


"***** Keyboard Shortcut *****"
"map <C-F12> :ls<CR>
"map <press Ctrl-V><press Ctrl-K> :ls<CR>
"map <C-Left> :bp<CR>
"map <C-Right> :bn<CR>

"map <m-Tab> :ls<CR>

"Command :Shell execute command and display output in a new window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

map <C-f> :Shell grep -r 
