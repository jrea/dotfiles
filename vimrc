call plug#begin()
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs'
Plug 'mxw/vim-jsx'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

let g:airline_theme='solarized'


" Turn on syntax highlighting
syntax on
" powerline
"  python from powerline.vim import setup as powerline_setup
"  python powerline_setup()
"  python del powerline_setup
" Enable loading filetype and indentation plugins
filetype plugin indent on

" more useful
set nocompatible

" Set the vim color theme to Soloarized
syntax enable
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" Line numbers
set number

set title

" Turn off line wrapping
set nowrap
set smarttab
set expandtab
set autoindent
set smartindent
set nostartofline
set noshowmode

set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
" set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Remember up to 1000 undos
set undolevels=1000

" Remember better history
set hidden

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 2 spaces for (auto)indent
set shiftwidth=2

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 2 spaces for <Tab> and :retab
set tabstop=2

" Use 2 spaces for <Tab> while performing editing operations, like insert a
" tab or using <BS>
set softtabstop=2

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
autocmd BufWinEnter * match WhitespaceEOL /\s\+$/

" Highlight .json
autocmd BufNewFile,BufRead *.json set ft=json

" Highlight .sass
autocmd BufNewFile,BufRead *.scss set ft=css

"------------------------------------------------------------------------------
" buftabs.vim Configuration
"------------------------------------------------------------------------------

  " Only print the filename of each buffer
    :let g:buftabs_only_basename=1

  " Show the buftabs in the statusline
  "  :let g:buftabs_in_statusline=1

  " Highlight the active buffer name in the buftab
  "  :let g:buftabs_active_highlight_group="Visual"


"------------------------------------------------------------------------------
" KEY MAPPINGS
"------------------------------------------------------------------------------

  " Various shortcuts for working with tabs
    map ,t :tabnew
    map ,d :tabprev<CR>
    map ,f :tabnext<CR>

  " Shortcuts for working with buffers
    map ,bn :bnext<CR>
    map ,bp :bprev<CR>
    map ,bd :bdelete
    map ,bl :buffers<CR>
    map ,b :buffer

  " NERD Tree
    map ,<TAB>r :NERDTreeMirror<CR>
    map ,<TAB>e :NERDTreeToggle<CR>

  " Toggle line numbers
    map ,# :set nu<CR>
    map ,## :set nonu<CR>

  " Toggle line wrapping
    map ,w :set wrap<CR>
    map ,ww :set nowrap<CR>

  " Toggle paste
    map ,pa :set paste<CR>
    map ,npa :set nopaste<CR>

  " New a new line? BR below...
    map brb o<ESC>k

  " New line above...
    map bra O<ESC>j

  " Search and replace
    map ,sr :%s/

  " g + direction for window split change. This beats the hell out of CTRL + W + direction
    map g <C-w>

  " Ensure gg still takes me to the top
    map gg :1<CR>

  " Open tag in new tab...
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

  " Or vertical split
    map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
  " Faster ctrlp lookup
    let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|node_modules|build|reports|screenshots)$',
    \ }

    let g:ctrlp_extensions = ['tag', 'buffertag', 'dir']
  " make some brackets
    imap {<cr> {<cr>}<c-o>O

  " Syntastic js
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_aggregate_errors=1
    let g:syntastic_javascript_checkers=['jsxhint']
    let g:syntastic_json_checkers=['jsonlint']
    let g:syntastic_html_tidy_ignore_errors=['proprietary attribute']

  " immediate escape
    if ! has('gui_running')
        set ttimeoutlen=10
        augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
        augroup END
    endif

  " json formatting
    function! FormatJSON()
        :%!python -m json.tool
    endfunction

  " remove whitespace
	function! RemoveWhitespace()
		if !&binary && &filetype != 'diff'
			normal mz
			normal Hmy
			%s/\s\+$//e
			normal 'yz<CR>
			normal `z
		endif
	endfunction

  " window splits like a boss
    set winheight=30
    set winminheight=5

  " search even better
    function! FindAll(stringToFind)
        :execute " grep -srnw --binary-files=without-match --exclude-dir='node_modules|build' . -e " . a:stringToFind . " " | copen 33
    endfunction
  " auto source when this file is saved
    autocmd bufwritepost .vimrc source $MYVIMRC

  " mave swp files to a better place
  set backupdir=~/.vim/backups
  set directory=~/.vim/swaps
  set undodir=~/.vim/undo

  "Persistent undo
  set undofile
  " JSX in js files
  let g:jsx_ext_required = 0

  " folding
  set foldenable
  set foldlevelstart=10
  set foldnestmax=10
  set foldmethod=indent
