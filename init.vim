let mapleader = " "

autocmd!
" disregard compatability
set number
set relativenumber
set termguicolors
set inccommand=split

filetype off
syntax enable
syntax sync fromstart

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Initialize Plugged
call plug#begin('~/.config/nvim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Vim Surround
Plug 'tpope/vim-surround'

" Vim vinegar (improvements to vim's file tree)
Plug 'tpope/vim-vinegar'

" Vitality
" (focus reporting)
" Plug 'sjl/vitality.vim'
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" let g:vitality_fix_focus = 1
" let g:vitality_always_assume_iterm = 1

" Super Retab
Plug 'rhlobo/vim-super-retab'

" Fuzzy Search
" Plug 'Shougo/denite.nvim'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'wezm/fzf.vim', { 'branch': 'rg' }

" Syntastic
" Plug 'scrooloose/syntastic'
" Neomake
Plug 'neomake/neomake'

" Commenting plugin (use gcc for a line or gc{motion})
Plug 'tpope/vim-commentary'

" Add 'ends' to things (eg do ... end)
Plug 'tpope/vim-endwise'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'fishbullet/deoplete-ruby'
Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:tern#filetypes = ['jsx', 'javascript.jsx']

" Buffer explorer
Plug 'jlanzarotta/bufexplorer'

" Tagbar
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Search
" Plug 'rking/ag.vim'

" Emmet
Plug 'mattn/emmet-vim'

" Whitespace
Plug 'ntpeters/vim-better-whitespace'

" Pair matching with []
Plug 'tpope/vim-unimpaired'

" Auto-pairing of symbols
Plug 'jiangmiao/auto-pairs'

" Navigate between Vim and Tmux splits
Plug 'christoomey/vim-tmux-navigator'

" Visually display marks in the sidebar
Plug 'kshenoy/vim-signature'

" Set Vim's wildignore based on .gitignore
Plug 'vim-scripts/gitignore'

" Generate ctags with :TagsGenerate
Plug 'szw/vim-tags'

" Run vim tests easily
Plug 'thoughtbot/vim-rspec'

" Dispatch
Plug 'tpope/vim-dispatch'

" BufOnly
Plug 'schickling/vim-bufonly'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Rails
Plug 'tpope/vim-rails'

" JavaScript
Plug 'pangloss/vim-javascript'

" React
Plug 'mxw/vim-jsx'

" Slim
Plug 'slim-template/vim-slim'
autocmd BufNewFile,BufRead *.slim set ft=slim

" Airline theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on

set background=dark

" Airline config
let g:airline_theme = "wombat"
" let g:airline_theme = "distinguished"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" Don't reset cursor to start of line when moving around
set nostartofline

set ls=2                        " show a status line even if there's only one window

" Improve vim's scrolling speed
set lazyredraw

set linespace=1                 " number of pixels between the lines
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

" Time out on key codes but not mappings
" set notimeout
" set ttimeout
" set ttimeoutlen=100

set foldmethod=syntax
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

" Default shell and shell syntax and source ~/.zshrc
" set shell=/bin/zsh\ --login
let g:is_bash=0
let g:is_zsh=1

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
" Strip whitespace on save (using vim-better-whitespace)
" autocmd BufWritePre * StripWhitespace

" Searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=0                 " keep a 5 line padding when moving the cursor

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

" Neomake Config
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
let g:neomake_php_enabled_makers = ['php']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_slim_enabled_makers = ['slimlint']
autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake

" Visible column at 100 and 110 chars
set colorcolumn=100,110
" Show text as error if over 110 characters
match ErrorMsg '\%>110v.\+'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Ruby / Rails Settings
" Intent private methods
let g:ruby_indent_access_modifier_style = 'indent'

" vim-spacebars
let g:mustache_abbreviations = 1

" Automatically source .vimrc when saved
if has('autocmd')
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

if has('nvim')
  " specify Python version for neovim
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'

  let g:deoplete#enable_at_startup = 1

  " " use the neovim strategy for vim-test
  " let test#strategy = "neovim"

  " neovim currently has some problems with ctrl-h
  " https://github.com/neovim/neovim/issues/2048
  nmap <BS> <C-W>h
endif

" Set spellcheck to enabled on markdown and git commit files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Generate ctags on save
let g:vim_tags_auto_generate = 1
" Use Dispatch.vim to generate the ctags
let g:vim_tags_use_vim_dispatch = 1

" FZF options
map <C-t> :Files<CR>

" Syntax for .god files
au BufReadPost *.god set filetype=ruby

