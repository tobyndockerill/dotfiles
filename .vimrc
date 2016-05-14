let mapleader = ","

autocmd!
" disregard compatability
set nocompatible
set number

filetype off
syntax enable
syntax sync fromstart

" Make sure we're using 256 colours
set t_Co=256

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

"Vim Surround
Plugin 'tpope/vim-surround'

" Vim vinegar (improvements to vim's file tree)
Plugin 'tpope/vim-vinegar'

" Fuzzy Search
Plugin 'kien/ctrlp.vim'
" Plugin 'wincent/command-t'

" Syntastic
Plugin 'scrooloose/syntastic'

" Commenting plugin (use gcc for a line or gc{motion})
Plugin 'tpope/vim-commentary'

" Add 'ends' to things (eg do ... end)
Plugin 'tpope/vim-endwise'

" Autocomplete (not currently compatible with neovim)
Plugin 'Valloric/YouCompleteMe'

" Autocomplete (compatible with neovim)
Plugin 'Shougo/deoplete.nvim'

" Buffer explorer
Plugin 'jlanzarotta/bufexplorer'

" Search
Plugin 'rking/ag.vim'

" Emmet
Plugin 'mattn/emmet-vim'

" Whitespace
Plugin 'ntpeters/vim-better-whitespace'

" Pair matching with []
Plugin 'tpope/vim-unimpaired'

" Auto-pairing of symbols
Plugin 'jiangmiao/auto-pairs'

" Navigate between Vim and Tmux splits
Plugin 'christoomey/vim-tmux-navigator'

" Visually display marks in the sidebar
Plugin 'kshenoy/vim-signature'

" Set Vim's wildignore based on .gitignore
Plugin 'vim-scripts/gitignore'

" Run vim tests easily
Plugin 'thoughtbot/vim-rspec'

" Dispatch
Plugin 'tpope/vim-dispatch'

" Indent Guides
Plugin 'nathanaelkane/vim-indent-guides'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Rails
Plugin 'tpope/vim-rails'

" Coffeescript
Plugin 'kchmck/vim-coffee-script'

" Airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Bunch of colorschemes
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set background=dark

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" Invisible characters
" set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" Don't reset cursor to start of line when moving around
set nostartofline

set hlsearch                    " highlight the search
set ls=2                        " show a status line even if there's only one window

" Improve vim's scrolling speed
set ttyfast
set lazyredraw

set wildmenu                    " show completion on the mode-line
set linespace=0                 " number of pixels between the lines
set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below
set nowrap
" set wrap                        " wrap long lines
set linebreak                   " break lines at word end
set nobackup                    " don't want no backup files
set nowritebackup               " don't make a backup before overwriting a file
set noswapfile                  " no swap files
set hidden                      " hide buffers when abandoned

" Highlight the current line
set cursorline
"
" Time out on key codes but not mappings
" set notimeout
" set ttimeout
" set ttimeoutlen=100

" Auto-reload buffers when files are changed on disk
set autoread

" Lines with equal indent form a fold.
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
" Open all folds by default
set nofoldenable

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

set vb                          " disable alert sound
set showcmd                     " display incomplete commands
set history=100                 " a ton of history

" Default shell and shell syntax and source ~/.zshrc
" set shell=/bin/zsh\ --login
let g:is_bash=0
let g:is_zsh=1


" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
" Strip whitespace on save (using vim-better-whitespace)
autocmd BufWritePre * StripWhitespace

" Searching
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=0                 " keep a 5 line padding when moving the cursor

set autoindent                  " indent on enter
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth

set switchbuf=""                " do not move focus/cursor to where the buffer is already open
set tagbsearch                  " use binary searching for tags

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
set shortmess=atI

" remove search highlighting
nnoremap <leader>h :noh<cr>

" Make switching between splits easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Set 'Y' to yank to end of line
map Y y$

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scss_checkers = ['scss_lint']
" disable for HTML files
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" Exclude the doc folder from CRTLp
set wildignore+=*/doc/*

" Visible column at 100 and 110 chars
set colorcolumn=100,110
" Show text as error if over 110 characters
match ErrorMsg '\%>110v.\+'

" CrtlP Settings
" List tags with ,.
nnoremap <leader>. :CtrlPTag<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "Dispatch rspec {spec}"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ruby / Rails Settings
" Intent private methods
let g:ruby_indent_access_modifier_style = 'indent'

" vim-spacebars
let g:mustache_abbreviations = 1

" Map the :Explore command
map <C-t> :Explore<CR>

" Automatically source .vimrc when saved
if has('autocmd')
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

if has('nvim')
  " specify Python version for neovim
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'

  let g:deoplete#enable_at_startup = 1

  " use the neovim strategy for vim-test
  let test#strategy = "neovim"
endif

" Set spellcheck to enabled on markdown and git commit files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

