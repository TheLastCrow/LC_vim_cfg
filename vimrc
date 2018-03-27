"coloration syntaxique
syntax on

"color background
set background=dark

"full screen mode
set lines=999 columns=999 linespace=0

"display line number
set number

"show command eg :2dd
set showcmd

"activer souris select/molette
set mouse=a

"surligner recherche
set hlsearch

colorschem hybrid

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

"font
if has('gui_win32')
    set guifont=DejaVu_Sans_Mono:h10:cANSI
  else
    set guifont=Monospace\ 11
  endif

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

" beautiful cmd line autocompletion
set wildmenu

"*********************"
"****Custom key*******"
"*********************"

" :help keycodes

""highlight with * without jump
nnoremap * *``

" :help jump
" jump previous
nnoremap <C-Up> <C-O>
" jump next
nnoremap <C-Down> <C-I>

" :help registers
" force copy in clipboard in * and + reg
vnoremap y "+y :let @*=@+ <CR>

noremap <m-z> :split<CR>
noremap <m-a> :vsplit<CR>
" noremap <Esc> :q<CR>

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

" up a dir
let g:NERDTreeMapUpdirKeepOpen='<m-Up>'

" *** Bookmark ***

" Bookmark display
let g:NERDTreeMapToggleBookmarks='<C-b>'

"set pwd as Bookmark (name of bookmark to be enter)
map <S-b> :Bookmark

"delete bookmark when focus on it
"Shift+d

"set fociused of NerdTree as new pwd :help NERDTree-cd
"cd 

"git nerdtree after bookmarke change:
"update pwd with cd
"refresh c f5

set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>19_refreshRoot() | endif
" autocmd CursorHold,CursorHoldI * call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w

" automatic switch cwd when open bookmark
let g:NERDTreeChDirMode=2


"*******************"
""***** tagbar *****"
"*******************"
map <C-F10> :TagbarToggle<CR>
map <C-z> :TagbarOpen fj<CR>
map <C-kPlus> :TagbarSetFoldlevel 99<CR>
map <C-kMinus> :TagbarSetFoldlevel 0<CR>

"*********************"
"***** Comentary *****"
"*********************"
"map for commentary
map <S-c>  <Plug>Commentary<Right>

"***********************"
"***** minibufexpl *****"
"***********************"
"auto load minbuf exp if no file open
if argc() == 0
    autocmd vimenter * MBEOpen
endif

" Open minibufexpl
map <C-F8> :MBEOpen<CR>

"switch left file
map <C-PageUp> :MBEbp<CR>

"switch right file
map <C-PageDown> :MBEbn<CR>

"switch previous file
" map <C-Up> :MBEbb<CR>

"switch next file
" map <C-Down> :MBEbn<CR>

"close curent file
map <C-w> :MBEbd<CR>

"Jump to mini buf exp wondow
"map <C-z> :MBEFocus<CR>

"*********************"
"***** lightline *****"
"*********************"
" disable mode in bottom bar
set noshowmode

let g:lightline = {
\ 'colorscheme': 'custom_style',
\ 'active' : {
\   'left': [
\     [ 'mode', 'paste' ],
\     [  'filename', 'modified', 'readonly', 'tag' ]
\   ],
\   'right': [
\     [ 'percent' ],
\     [ 'lineinfo' ],
\     [ 'fileformat', 'fileencoding', 'filetype' ]
\   ]
\ },
\ 'inactive' : {
\   'left' : [
\     [ 'filename' ],
\   ],
\   'right' : [
\     [ 'percent' ],
\     [ 'lineinfo' ],
\     [ 'fileformat', 'fileencoding', 'filetype' ]
\   ]
\ },
\ 'component' : {
\   'print_test' : 'Hello, world!',
\   'char_test' : '0x%B',
\   'tag' : '%{tagbar#currenttag("%s", "default", "f" )}'
\ },
\ 'component_function': {
\   'gitbranch' : 'fugitive#head',
\ }
\}

"****************************"
"***** vim-indent-guide *****"
"****************************"

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"*****************"
"***** other *****"
"*****************"

" togle relative line number 
map <C-F4> :set relativenumber!<CR> 

function! GoBuffer(count)
  let test = ":b" . a:count
  execute test
endfunction

command! -nargs=1 GoBufferCmd call GoBuffer(<args>)
map ² :<C-U>GoBufferCmd(v:count)<CR><CR>

"----------------------------------------------------------------------------
"" window shortcut
"----------------------------------------------------------------------------
" tab in order to switch window
map <Tab> :wincmd w<CR>

" shift tab in order to switch previous window
map <S-Tab> :wincmd W<CR>

"-----------------------------------------------------------------------------
"" Search macro
"----------------------------------------------------------------------------

if has('gui_win32')
    " map <C-f> :execute search_tool . " /" . expand("<cword>") . "/gj %" <Bar>:lopen<CR>
    map <C-f> :execute ":noautocmd lvimgrep /" . expand("<cword>") . "/gj %" <Bar>:lw<CR>
    map <S-f> :execute ":noautocmd lvimgrep /" . expand("<cword>") . "/gj **" <Bar>:lw<CR>
    
    command! -complete=shellcmd -nargs=+ Sf call SearchFile(<q-args>)
    function SearchFile(name)
      let cmd = ":lvimgrep /".a:name."/gj %"
      execute cmd
      :lopen
    endfunction
    
    command! -complete=shellcmd -nargs=+ Sa call SearchAll(<q-args>)
    function SearchAll(name)
      let cmd = ":lvimgrep /".a:name."/gj **"
      execute cmd
      :lopen
    endfunction
    
else
    map <C-f> :execute ":lgrep " . expand("<cword>") . " %" <CR><Bar>``:lw<CR>
    map <S-f> :execute ":lgrep -r " . expand("<cword>") . " . --exclude tags" <CR><Bar>``:lw<CR>
    
    command! -complete=shellcmd -nargs=+ Sf call SearchFile(<q-args>)
    function SearchFile(name)
      let cmd = ":lgrep ".a:name." %"
      execute cmd
      call feedkeys("\<CR>")
      :lw
    endfunction
    
    command! -complete=shellcmd -nargs=+ Sa call SearchAll(<q-args>)
    function SearchAll(name)
      let cmd = ":lgrep -r ".a:name." . --exclude tags"
      execute cmd
      call feedkeys("\<CR>")
      :lw
    endfunction
    
endif


"-----------------------------------------------------------------------------
"" Replace macro
"-----------------------------------------------------------------------------
command! -complete=shellcmd -nargs=+ Ra call ReplaceAll(<q-args>)
function ReplaceAll(arg)
  let build_arg = substitute(a:arg, " ", "/", "")
  let cmd = ":%s/".build_arg."/g"
  echo cmd
  if input("Confirm Enter/no?") == ""
    execute cmd
  else
    echo "command cancel!"
  endif 
endfunction

command! -complete=shellcmd -nargs=+ Rc call ReplaceConfirm(<q-args>)
function ReplaceConfirm(arg)
  let build_arg = substitute(a:arg, " ", "/", "")
  let cmd = ":%s/".build_arg."/gc"
  echo cmd
  if input("Confirm Enter/no?") == ""
    execute cmd
  else
    echo "command cancel!"
  endif 
endfunction

command! -complete=shellcmd -nargs=+ Rs call ReplaceSelection(<q-args>)
function ReplaceSelection(arg)
  let build_arg = substitute(a:arg, " ", "/", "")
  let cmd = ":'<,'>s/".build_arg."/g"
  echo cmd
  if input("Confirm Enter/no?") == ""
    execute cmd
  else
    echo "command cancel!"
  endif 
endfunction
  
"-----------------------------------------------------------------------------
"" Backup files
"-----------------------------------------------------------------------------

let $YGA_TMP_VIM_DIR = $HOME . "/vim_tmps"
if filewritable($YGA_TMP_VIM_DIR) == 0
    call mkdir($YGA_TMP_VIM_DIR)
    endif
"
"    " Backup
    set backupdir=$YGA_TMP_VIM_DIR
    set backupext=.bak " Extension .bak
    set backup

"----------------------------------------------------------------------------
"" c/c++ ctags
"----------------------------------------------------------------------------
"" map <ctrl>+F12 to generate ctags for current folder:
autocmd FileType c,cpp map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" map <C-F12> :!ctags -R --languages=javascript --tag-relative --exclude=node_modules **<CR>

" :help tag-matchlist
" choose in list
map <C-CR> g]
" get first occurance
" map <C-CR> :execute "tag ".expand("<cword>")<CR>
" alt-enter go to next definition (broken)
" map <A-CR>:tn<CR>

"----------------------------------------------------------------------------
"" other
"----------------------------------------------------------------------------

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

" map <C-f> :Shell grep -r 

"filetype ???
"filetype plugin indent on
filetype plugin on


"***** Keyboard Shortcut *****"
"map <C-F12> :ls<CR>
"map <press Ctrl-V><press Ctrl-K> :ls<CR>
"map <C-Left> :bp<CR>
"map <C-Right> :bn<CR>

"map <m-Tab> :ls<CR>

