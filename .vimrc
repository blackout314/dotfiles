"Note for MACOSX: brew install vim --with-python3 --with-lua --with-override-system-vi

"===== Basic configuration ====="
set nocompatible
set incsearch
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set number
set list
set laststatus=2
set cursorcolumn
set cursorline
set nowrap
set noswapfile
set backspace=indent,eol,start
syntax on

"===== Colors and theme ====="
set t_Co=256
let g:molokai_original = 1
colorscheme molokai

"===== Plugins ====="
" Filetype off is required by vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" Vundle plugins
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Shutnik/jshint2.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete'
Plugin 'Townk/vim-autoclose'
Plugin 'alvan/vim-closetag'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"===== Lightline status bar configuration ====="
let g:lightline = {
    \ "component": {
        \ "readonly": '%{&readonly?"⭤":""}',
    \ },
    \ "active": {
    \   "left": [ [ "mode", "paste" ], [ "fugitive", "filename" ], [ "syntastic" ] ]
    \ },
    \"component_function": {
    \    "fugitive": "MyFugitive",
    \ },
    \ "component_expand": {
    \   "syntastic": "SyntasticStatuslineFlag",
    \ },
    \ "component_type": {
    \   "syntastic": "error",
    \ },
    \ "separator": { "left": "\ue0b0", "right": "\ue0b2" },
    \ "subseparator": { "left": "\ue0b1", "right": "\ue0b3" }
\ }

function! MyFugitive()
    try
        if expand("%:t") !~? "Tagbar\|Gundo\|NERD" && &ft !~? "vimfiler" && exists("*fugitive#head")
            let mark = ""  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? "\ue0a0 " . _ : "\ue0a0 no-branch"
        endif
    catch
    endtry
    return ""
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

"===== Syntax ====="
syntax on
au BufNewFile,BufRead *.scss,*.sass set syntax=css
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim

"JSX configuration
let g:jsx_ext_required = 0

"Closetag configuration
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.hbs"

"Autocomplete configuration
let g:neocomplete#enable_at_startup = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Syntastic configuration
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 2
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_java_javac_autoload_maven_classpath = 0
