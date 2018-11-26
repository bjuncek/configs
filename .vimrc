source $ADMIN_SCRIPTS/master.vimrc

autocmd! bufwritepost .vimrc source %

set background=dark
colorscheme solarized
"colorscheme desert

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
 endif

  set showcmd
  set showmatch
  set ignorecase
  set smartcase
  set incsearch
  set autowrite
  set hidden
  set mouse=a

  syntax enable

  map <C-j> <C-w>j
  map <C-h> <C-w>h
  map <C-k> <C-w>k
  map <C-l> <C-w>l

  set shiftwidth=4
  set tabstop=4
  set softtabstop=4
  set expandtab
  set smarttab

  set backspace=2
  set number
  set showcmd
  set showmode
  set hlsearch
  set incsearch
  set scrolloff=5
  set tw=79

  "call pathogen#incubate()
  "call pathogen#infect()
  "call pathogen#helptags()

  highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
  match OverLength /\%>80v.\+/

  set dictionary=/usr/share/dict/words

  set tags=tags;/
  set tags +=~/.vim/qttags

  au FileType make    setlocal noexpandtab
  au FileType pyhton  set tabstop=2|set shiftwidth=4|set expandtab
  au FileType php     set tabstop=2|set shiftwidth=2|set expandtab
  au FileType *       set formatoptions+=tcq

  map <C-p> <ESC>:w<CR>:!<UP><CR>

  fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
      let c = col(".")
        %s/\s\+$//e
          call cursor(l, c)
          endfun

          autocmd FileType cpp,java,php,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

          " Set the status line the way i like it
          set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\Buf:#%n\[%b][0x%B]
          " tell VIM to always put a status line in, even if there is only
          " one window
          set laststatus=2

          nmap <Leader>t :Unite -start-insert monocle<CR>
          nmap <C-]> :UniteWithCursorWord -start-insert monocle<CR>
         nmap <C-t> <C-o>
