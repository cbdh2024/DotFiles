"  Set up some options.
set expandtab    " Expand tabs to spaces.
set tabstop=3    " Tabstop every 3 characters.
set shiftwidth=3 " Match tab stop for shifts.
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
"set noautoindent " I hate autoindent.
set autoindent
"moved to only c set cindent
set wildmenu     " Autocomplete options for menu commands
"set equalalways  " Keep all splits equal in size.  This takes effect when a new
                 " split is created (or one is deleted, etc), but still allows
                 " me to manually resize things.
"Folding settings because sometimes you want to hide stuff
set foldenable
set foldmarker={,}
set foldmethod=indent "sets fold on indent
set foldlevelstart=15 "starts folding on the 10th indent
match ErrorMsg '\%>120v.\+'

"Pathogen to Start All Plugins
execute pathogen#infect()

"  Code folding.  Really feel like I should like this.  But vim makes too many
"  dumb decisions and it just usually ends up annoying me.
nnoremap <space> za

"  Look for tags.
set tags=./tags,tags,../tags,/usr/include/tags


"  Turn on syntax highlighting.
syntax on
"hi Comment ctermfg=Blue
set t_Co=256
colorscheme monokai

"  Stuff for csupport.
"let g:C_AuthorName = 'Josh Hamacher'
"let g:C_AuthorRef  = 'JH'
"let g:C_Email      = 'josh.hamacher@faac.com'
"let g:C_Company    = 'FAAC Inc.'

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
   "  These are specific for Perforce.
   "if !exists("au_p4_cmd")
     "let au_p4_cmd=1
     "au BufEnter * call IsUnderPerforce()
     "au FileChangedRO * call P4Checkout()
   "endif

endif

"  When scrolling, by default the cursor moves to the edge of the screen.  Make
"  it so that the cursor retains is current position within the screen.
"map  ^Ej
map ^K ^Yk

map <F2> :setlocal spell! spelllang=en_us<CR>

"  This is a little oddity that performs rot-13 on the contents of the current
"  buffer.  Useless, but cool.
"map <F3> ggVGg?
map <F3> <PageUp>
map <F4> <PageDown>


"  Comment (C++-style) visual blocks.
map <F5> :s.^.//. <CR> :noh <CR>
map <F6> :s.^//.. <CR> :noh <CR>
"  This is supposed to comment only non-blank lines.  Doesn't work, don't feel
"  like playing with it now.
"map <F5> :.,/^}/-s:^\(.\):/:

"  Set up shortcuts for next and previous tag.
map <F7> :tnext<CR>
map <F8> :tprev<CR>

"  Set up some compiling shortcuts.
map <F9> :cnext<CR>
map <F10> :cprev<CR>
map <F11> :make clean all<CR>
map <F12> :make<CR>
map <F16> :setlocal spell! spelllang=en_us<CR>
"jk is escape
inoremap jk <esc>

nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
"-------------------------------------------------------------------------------
"  Functions
"-------------------------------------------------------------------------------

" If this file is in Perforce, set a buffer-local variable.
"function IsUnderPerforce()
   "  Use the existence of this environment as an indicator of whether or not
   "  Perforce is set up.
"   if exists("$P4CONFIG")
      "  Assume failure.
"      let b:inp4 = 0

      "  Perforce is set up.  Now try to determine if this file is in Perforce.
"      let l:cmd = \"p4 have \" . expand("%:p") . \" 2>&1"
"      let l:rep = system(cmd)
"      if rep =~ \".*not under client's root.*"
"         echo \"This file is not under your client root"
"      elseif rep =~ \".*not on client"
"         echo \"This file is not part of your client"
"      else
"         let b:inp4 = 1
"      endif
"   else

"echo \"Is Perforce set up?"
"   endif
"endfunction

" Confirm with the user, then checkout a file from perforce.
"function P4Checkout()
"   if b:inp4 > 0
"      if (confirm("Checkout from Perforce?", "&Yes\n&No", 1) == 1)
"         call system("p4 edit " . expand("%:p") . " > /dev/null")
"         if v:shell_error == 0
"            set noreadonly
"         endif
"      endif
"    endif
"endfunction
