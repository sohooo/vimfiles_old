" -----------------------------------------
"  .vimrc by Sven Sporer
"  created: Apr 1, 2009
" -----------------------------------------
"  thanks to jferris, jamisbuck, peepcode


" use Vim settings, rather than vi settings
" has to be first because it influences other options
set nocompatible

" load plugins in bundle dir
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on


" Pretty visuals
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Code formatting
set sts=2
set smarttab
set shiftwidth=2
set expandtab
 
" case only matters with mixed case expressions
set ignorecase
set smartcase

set wildmenu                        " enhanced command line completion
set backspace=indent,eol,start      " backspacing over everything in insert mode
set novisualbell                    " stop flashing

set nobackup                        " no backups before overwriting files
set nowritebackup                   " same as above
set directory=$HOME/.vim/tmp//,.    " keep swap files in one location


set t_Co=8                          " 8 colors for old terms; <leader>c to switch
set antialias                       " MacVim: smooth fonts
set encoding=utf-8                  " use UTF-8 everywhere
set number                          " show line numbers
set numberwidth=5                   " width of line numbers
set cursorline                      " highlight current cursor position
set laststatus=2                    " Always display the status line
set history=50                      " keep 50 lines of command line history
set ruler                           " show the cursor position all the time
set showcmd                         " display incomplete commands
set showmode                        " display mode you're in
set incsearch                       " do incremental searching
set hlsearch                        " highlight search results
set hidden                          " dont display some warnings
set wrap                            " turn on line wrapping
set scrolloff=3                     " show 3 lines of context around cursor
set notitle                         " set terminal's title

syntax on
colorscheme default

" Display extra whitespace
"set list listchars=tab:»·,trail:


" Only do this part when compiled with support for autocommands.
if has("autocmd")
 
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
 
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
 
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
 
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif
 
  augroup END

  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline

  " turn syntax highlighting on all the friggin' time;
  " that way, chars > 80 get highlighted always
  autocmd BufRead,BufNewFile * :syntax on

else
 
  set autoindent    " always set autoindenting on
 
endif " has("autocmd")
 
if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=1
  set foldnestmax=4
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
 
  " automatically open folds at the starting cursor position
  " autocmd BufReadPost .foldo!
endif
 

" GVim settings
if has("gui_running")
  
  "Maximize GVim window
  set lines=50 columns=130
  colorscheme molokai
  "colorscheme wombat

  if has("macunix")
    set guifont=Menlo:h12,Panic\ Sans:h13,Monaco:h12,Inconsolata:h14,Andale\ Mono:h14,DejaVu\ Sans\ Mono:h14
  elseif has("unix")
    set guifont=Droid\ Sans\ Mono\ Dotted\ 11,Inconsolata\ Medium\ 12,Monaco\ 10,DejaVu\ Sans\ Mono\ 11
  endif
  
endif

if has("statusline")
  set statusline=%<%f\
  set statusline+=%w%h%m%r
  set statusline+=%{fugitive#statusline()}
  set statusline+=\ [%{&ff}/%Y]
  set statusline+=\ [%{getcwd()}]
  set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
endif

" Keybindings
let mapleader=","  

" toggle funky color modes
map <leader>c :call ToggleColorSettings()<cr>
:nnoremap <leader>pp :call PresentationToggle()<cr>
:nnoremap <leader>bw :call BitweaverSettings()<cr>
:nnoremap <leader>mw :call MediawikiSettings()<cr>

":nnoremap <leader>d :NERDTreeToggle<cr>
:nmap <leader>d :TrinityToggleNERDTree<cr>
:nmap <leader>t :TrinityToggleTagList<cr>
":nmap <leader>s :TrinityToggleSourceExplorer<cr>

" Yankring bindings
:nmap <leader>y :YRShow<cr>
:imap <leader>y <esc>:YRShow<cr>


" EasyGrep settings
let g:EasyGrepMode=0 
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=0
let g:EasyGrepHidden=0
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=1
let g:EasyGrepReplaceWindowMode=2
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepWindowPosition='botright'
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=0
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepFileAssociationsInExplorer=1
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0

:autocmd FileType ruby noremap <c-m> :!/usr/bin/ruby %<cr>
:autocmd FileType ruby noremap <c-n> :!/usr/bin/ruby -cw %<cr>

:autocmd FileType perl noremap <c-m> :!/usr/bin/perl -w %<cr> 
:autocmd FileType perl noremap <c-n> :!/usr/bin/perl -cw %<cr>

" Hide search highlighting
map <Leader>h :set invhls <CR>

" toggle paste mode on/off
map <F9> :set paste!<cr>:set paste?<cr>

" toggle line numbers
map <F10> :set number!<cr>:set number?<cr>

" tab navigation like firefox
" :nmap <C-h> :tabprevious<CR>
" :map  <C-h> :tabprevious<CR>
" :imap <C-h> <Esc>:tabprevious<CR>i
" :nmap <C-l> :tabnext<CR>
" :map  <C-l> :tabnext<CR>
" :imap <C-l> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<cr>
:imap <C-t> <Esc>:tabnew<cr>

" easy tab switching
:nmap tt :tabnext<cr>
:map  tt :tabnext<cr>

" easy split windows switching
:nmap <c-h> <c-w>h
:map  <c-h> <c-w>h
:nmap <c-j> <c-w>j
:map  <c-j> <c-w>j
:nmap <c-k> <c-w>k 
:map  <c-k> <c-w>k 
:nmap <c-l> <c-w>l
:map  <c-l> <c-w>l
:map <enter> o

" same indent behaviour in visual mode
:vmap > >gv
:vmap < <gv

" markdown syntax
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" other syntaxes
au BufRead,BufNewFile *.textile   set filetype=textile
au BufRead,BufNewFile *.bitw      set filetype=bitw
au BufRead,BufNewFile *.wiki      set filetype=mediawiki
au BufRead,BufNewFile *.mwiki     set filetype=mediawiki
au BufRead,BufNewFile *.techwiki* set filetype=mediawiki

" No Help, please
nmap <F1> <Esc>

" remap escape; this rox
imap jj <Esc>

" you know what i mean!
:command WQ wq
:command Wq wq
:command W w
:command Q q

" script to toggle colors and colorscheme
function ToggleColorSettings ()
  if (&t_Co == 8)
    set t_Co=256
    colorscheme mustang
    echo "enjoy the funky colors!"
  else
    set t_Co=8
    colorscheme default
    echo "boring colors on now"
  endif
endfunction

" Terminal settings (no alternativ screen)
 set t_ti=
 set t_te=

" Profiles
function BitweaverSettings ()
  set filetype=bitw
  set lbr
endfunction

function MediawikiSettings ()
  setf mediawiki
endfunction

function PresentationToggle ()
  if (&guifont == "Lucida_Console:h10") 
    echo "presentation mode"
    set guifont=Lucida_Console:h30
  else
    echo "normal mode"
    set guifont=Lucida_Console:h10
    set lines=50
    set columns=85
  endif
endfunction

" Enable user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
