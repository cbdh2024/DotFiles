"  Set up basic options
set expandtab    " Expand tabs to spaces.
set tabstop=2    " Tabstop every 3 characters.
set shiftwidth=2 " Match tab stop for shifts.
set nowrap       " Do not wrap long lines.
set sidescroll=2 " Scroll sideways by 2 columns at a time.
set ruler        " Show position within file.
set showmatch    " Show matching paranthesis.
set rnu          " Set relative line number
set laststatus=2 " Show status bar; 2 = always.
set history=100  " How many lines of command history are kept.
set wildmode=longest:full,full " Show possible filenames for completion.
set incsearch    " Incremental search - one of the few things emacs got right.
set hlsearch     "highlights maches
set ignorecase   "Ignore the case of a search because reasons
set smartcase    "If you search with caps it will assume case sensitive
set autoindent
set wildmenu     " Autocomplete options for menu commands
set foldenable "Folding settings because sometimes you want to hide stuff
set foldmarker={,}
set foldmethod=indent "sets fold on indent
set foldlevelstart=15 "starts folding on the 10th indent
set cursorline

call plug#begin()
  Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'vim-syntastic/syntastic'
  Plug 'elixir-editors/vim-elixir'
call plug#end()

"Only 120 line lengths
match ErrorMsg '\%>120v.\+'


"  Look for tags.
set tags=./tags,tags,../tags,/usr/include/tags

"  Turn on syntax highlighting.
syntax on
"hi Comment ctermfg=Blue
set t_Co=256
colorscheme monokai

hi Normal guibg=NONE ctermbg=NONE
hi lineNr ctermbg=NONE guibg=NONE
hi CursorLine cterm=NONE ctermbg=239

"  Set up autocommands.
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  "  Remove the annoying 'jump to last position' crap that Suse seems to think
  "  is a good idea.
  au! BufReadPost

  "  Handle binary files correctly.
  "  Can add more extensions using comma-separated list.
  augroup Binary
    au!
    au BufReadPre  *.lib let &bin=1
    au BufReadPost *.lib if &bin | %!xxd
    au BufReadPost *.lib set ft=xxd | endif
    au BufWritePre *.lib if &bin | %!xxd -r
    au BufWritePre *.lib endif
    au BufWritePost *.lib if &bin | %!xxd
    au BufWritePost *.lib set nomod | endif
  augroup END

  "  Wrap text in pure text files.
  autocmd BufReadPre *.txt set wrap

  "  Let real tabs occur in Makefiles - about the only place they're useful
  autocmd BufReadPre ?akefile set noexpandtab

  "  System include files assume a tab width of 4.
  autocmd BufReadPre /usr/include/*.h set tabstop=4
  autocmd BufReadPre /usr/include/sys/*.h set tabstop=4

  " set cindent for c files only
  autocmd BufReadPre *.c set cindent
  autocmd BufReadPre *.cpp set cindent

  autocmd BufReadPRe *.tex set wrap

  " Run nerdtree when opening a file because it's great
  autocmd vimenter * NERDTree
endif

"  When scrolling, by default the cursor moves to the edge of the screen.  Make
"  it so that the cursor retains is current position within the screen.
"map  ^Ej
map ^K ^Yk

map <F2> :setlocal spell! spelllang=en_us<CR>

map <F3> <PageUp>
map <F4> <PageDown>

"jk is escape
inoremap jk <esc>

"  Code folding.  Really feel like I should like this.  But vim makes too many
"  dumb decisions and it just usually ends up annoying me.
nnoremap <space> za

"Setup switching panes using the arrow keys
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
