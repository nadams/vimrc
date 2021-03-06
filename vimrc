"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'git@github.com:kien/ctrlp.vim.git'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'DavidEGx/ctrlp-smarttabs'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'derekwyatt/vim-scala'
Plugin 'Valloric/YouCompleteMe.git'
Plugin 'flazz/vim-colorschemes.git'
Plugin 'fatih/vim-go'
Plugin 'matze/vim-move'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'othree/html5.vim'
Plugin 'mkitt/tabline.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/dbext.vim'
Plugin 'stephpy/vim-yaml'
Plugin 'chase/vim-ansible-yaml'
Plugin 'exu/pgsql.vim'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
"Plugin 'lepture/vim-velocity'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>W :w!<cr>
" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null
"
nmap <leader>r :redraw!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
set wildmode=longest,list

set nu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic onset magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1
set foldmethod=indent
set foldlevel=99

"set mouse=a
set ttymouse=xterm2
set ttyfast


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set t_Co=256

""""" Kolor Settings """""
let g:kolor_underlined=1
let g:kolor_alternative_matchparen=1

" Enable syntax highlighting
syntax enable 

try
  colorscheme kolor 
  hi TabLine      ctermfg=Black  ctermbg=Grey      cterm=NONE
  hi TabLineFill  ctermfg=Black  ctermbg=Grey      cterm=NONE
  hi TabLineSel   ctermfg=Black  ctermbg=White     cterm=NONE
catch
endtry

"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set nowrap

map OA <up>
map OB <down>
map OC <right>
map OD <left>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" neio = arrows
noremap n h
noremap i gk
noremap e gj
noremap o l
noremap h o
noremap H O
noremap N ^
noremap O $
noremap I <C-B>
noremap E <C-F>

inoremap <c-n> <c-o>h
inoremap <c-i> <c-o>gk
inoremap <c-e> <c-o>gj
inoremap <c-o> <c-o>l
" f/F = backward word
noremap f b
noremap F B

" Remap for f -> r / F -> R
noremap r f
noremap R F
noremap k m

" s/S = inSert
noremap s i|noremap S I
" k/K = last search
noremap m n|noremap M N
" l/L = BOL / EOL | <c-l> = join lines
noremap l ^|noremap L $|noremap <C-l> J
" j/J = end of word
noremap j e|noremap J E
" _r_ = inneR text objects
onoremap r i
" c-e/c-n/c-m or <cr> = High/Low/Mid
"noremap <c-e> H|noremap <c-n> L|noremap <c-m> M
" shift+direction switches split panes
"noremap H <C-W>h|noremap I <C-W>l|noremap N <C-W>j|noremap E <C-W>k
" c-h/c-i switches tabs [inoremap <c-i> messes up insert-mode tabbing]
"nnoremap <c-i> <C-PageDown>|nnoremap <c-h> <C-PageUp>
" U = Redo with U
noremap U <C-r>

" Not Colemak specific, but I like it :)
noremap ; :

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move windows
noremap <C-e> <C-W>J
noremap <C-i> <C-W>K
noremap <C-n> <C-W>H
noremap <C-o> <C-W>L
noremap <C-h> <C-W>r
noremap <C-H> <C-W>R
noremap <C-l> <C-W>n
noremap <C-k> <C-W>q

noremap = <c-w>+
noremap - <c-w>-
noremap + <c-w>>
noremap _ <c-w><

noremap <C-W>n :wincmd h<CR>
noremap <C-W>e :wincmd j<CR>
noremap <C-W>i :wincmd k<CR>
noremap <C-W>o :wincmd l<CR>
nnoremap <C-W><C-O> <NOP>
nnoremap <C-W><C-N> <NOP>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Reload all buffers from disk
map <leader>br :checktime<cr>

" Tab bindings 
nnoremap tn  :tabfirst<CR>
nnoremap ti  :tabnext<CR>
nnoremap te  :tabprev<CR>
nnoremap to  :tablast<CR>
nnoremap tl  :tabedit<CR>
nnoremap tm  :tabm<Space>
nnoremap tk  :tabclose<CR>

map <leader>ff :botright cwindow<cr>


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=%{HasPaste()}%f%m%r%h\ %{fugitive#statusline()}\ %<%r%{getcwd()}%h\ \ \ %=Line:\ %l/%L\ (%P)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>vg :vimgrep // **/*.*<left><left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

nmap <leader>ln :set invnumber<CR>

if !exists(":Q") 
  command Q q
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let @y='gg"+yG'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePre *.{js,scala,go,java,xml,sql} call StripTrailingWhitespace()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! StripTrailingWhitespace()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunc

""""" CtrlP """""
map <leader>, :CtrlP<cr>
nnoremap <Leader>fu :CtrlPFunky<Cr>
let g:ctrlp_max_files = 0
let g:ctrlp_follow_symlinks = 1 
let g:ctrlp_extensions = ['funky']
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_working_path_mode = ''
"let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/default_products/*,*/target/*,*/bower_components/*,*/node_modules/*,*/GoDeps/_workspace/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|Godeps[\/]_workspace$',
  \ }

""""" Eclimd """""
let g:EclimCompletionMethod = 'omnifunc'


""""" Move """""
let g:move_map_keys = 0
vmap <C-Down> <Plug>MoveBlockDown
vmap <C-Up> <Plug>MoveBlockUp
nmap <A-Down> <Plug>MoveLineDown
nmap <A-Up> <Plug>MoveLineUp


""""" NerdTREE """""
"autocmd vimenter * NERDTree
nmap <silent><leader>nt :NERDTreeToggle<CR>
let g:NERDTreeMapOpenExpl = ''
let g:NERDTreeMapOpenSplit = 'S'
let g:NERDTreeMapToggleHidden = 'H'
let g:NERDTreeMapJumpLastChild = 'E'
let g:NERDTreeMapJumpFirstChild = 'I'
let g:NERDTreeMapJumpNextSibling = '<c-e>'
let g:NERDTreeMapJumpPrevSibling = '<c-i>'
let g:NERDTreeMapToggleZoom = 'z'


""""" BufExplorer """""
map <leader>b :BufExplorer<CR>

""""" YCM """""
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_server_python_interpreter = '/usr/bin/python3'
set completeopt-=preview

""""" Fugitive """""
autocmd BufReadPost fugitive://* set bufhidden=delete


""""" Go Bindings """""
au Filetype go nmap <leader>l :GoLint<CR>
au Filetype go nmap <leader>gb :GoBuild<CR>
"au Filetype go nmap <leader>r :GoRun<CR>
au Filetype go nmap <leader>t :GoTest<CR>
au Filetype go nmap <leader>at :GoTest ./...<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"
let g:go_term_enabled = 1
let g:go_list_type = "quickfix"

""""" Preview """""
:nmap <Leader>PP :Preview<CR>

""""" Json """""
let g:vim_json_syntax_conceal = 0

if filereadable(".vimrc_proj")
  so .vimrc_proj
endif

let g:sql_type_default = 'pgsql'

""""" Diff """""
nmap <silent><leader>wdt :windo diffthis<CR>
nmap <silent><leader>wdo :windo diffoff<CR>
nmap <silent><leader>wdu :windo diffupdate<CR>

""""" Java Bindings """""
au Filetype java nmap <leader>ii :JavaImport<CR>
au Filetype java nmap <leader>io :JavaImportOrganize<CR>
au Filetype java setl sw=4 sts=4 et

