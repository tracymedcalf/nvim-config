" Needed to make ctrl-v paste in insert mode
map <space> <Ctrl-V>
if 1
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif
imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>
imap <c-u> <esc>viwU
nmap <c-u> <esc>viwU


set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a 

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  "set thesaurus+=~/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WP call WordProcessor()

" Restart vim and call PlugInstall
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jlcrochet/vim-razor'
call plug#end()

" tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75
hi tsxTag guifg=#3FFFEF
hi tsxCloseTag guifg=#3FFFEF
hi tsxCloseTagName guifg=#E06C75

map - ddkP
map _ ddp
