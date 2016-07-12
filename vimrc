"coloration syntaxique
syntax on

"color background
set background=dark

"full screen mode
set lines=999 columns=999

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
colorschem hybrid

"no icon bar
set guioptions-=T

"tabulation setting
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

"activate backspace for windows
set backspace=2
set backspace=indent,eol,start

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

"auto load at start if no file in arg
if argc() == 0
    autocmd vimenter * NERDTree
endif

"ignore pyc files"
let NERDTreeIgnore=['\.pyc$', '\~$']

"jump to NerdTree window
map <C-a> :NERDTreeToggle<CR>:NERDTreeToggle<CR>

"open/close NerdTree window
map <C-F9> :NERDTreeToggle<CR>

" refresh tree from Root 
let g:NERDTreeMapRefreshRoot='<C-F5>'

" Bookmark display and set
let g:NERDTreeMapToggleBookmarks='<C-b>'
map <S-b> :Bookmark

" up a dir
let g:NERDTreeMapUpdirKeepOpen='<m-Up>'

"*******************"
""***** tagbar *****"
"*******************"
map <C-F10> :TagbarToggle<CR>
map <C-z> :TagbarOpen fj<CR>


"*********************"
"***** Comentary *****"
"*********************"
"map for commentary
map <S-c>  <Plug>Commentary<Right>

"***********************"
"***** minibufexpl *****"
"***********************"
"switch left file
map <C-PageUp> :MBEbp<CR>

"switch right file
map <C-PageDown> :MBEbn<CR>

"switch previous file
map <C-Up> :MBEbb<CR>

"switch next file
map <C-Down> :MBEbn<CR>

"close curent file
map <C-w> :MBEbd<CR>

"Jump to mini buf exp wondow
"map <C-z> :MBEFocus<CR>

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


"-----------------------------------------------------------------------------
"" Backup files

let $YGA_TMP_VIM_DIR = $HOME . "/vim_tmps"
if filewritable($YGA_TMP_VIM_DIR) == 0
    call mkdir($YGA_TMP_VIM_DIR)
    endif
"
"    " Backup
    set backupdir=$YGA_TMP_VIM_DIR
    set backupext=.bak " Extension .bak
    set backup

"-----------------------------------------------------------------------------
"" c/c++
"----------------------------------------------------------------------------
"" map <ctrl>+F12 to generate ctags for current folder:
autocmd FileType c,cpp map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


" tab in order to switch window
map <Tab> :wincmd w<CR>



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
  " setlocal nomodifiable
  " 1
endfunction

map <C-f> :Shell grep -r 
