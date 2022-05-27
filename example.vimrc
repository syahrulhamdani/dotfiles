set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" all Plugin here
Plugin 'dense-analysis/ale'
Plugin 'dracula/vim',{'name':'dracula'}
Plugin 'itchyny/lightline.vim'
Plugin 'kyoz/purify',{'rtp':'vim'}
Plugin 'mengelbrecht/lightline-bufferline'
Plugin 'junegunn/fzf.vim'
Plugin 'rakr/vim-one'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'sonph/onehalf',{'rtp': 'vim'}
Plugin 'stephpy/vim-yaml'
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'psliwka/vim-smoothie'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on

syntax on
" colorscheme dracula
colorscheme purify
" colorscheme onehalfdark
" colorscheme one
" set background=dark
set colorcolumn=79

" vim-fzf configuration
set rtp+=/usr/local/opt/fzf

" YAML configuration
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**
" Display all the matching files using `tab`
set wildmenu

" vim-markdown config
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks = 0

" indentation line configuration
let g:indentLine_char_list=['|', '¦', '┆', '┊']

" YCM configuration
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_enable_diagnostic_sign=0
let g:ycm_enable_diagnostic_highlighting=0

" ALE configuration
let g:ale_linters = {
			\ 'python': ['pylint', 'flake8', 'mypy']
\ }
let g:ale_fixers = {'python': ['trim_whitespace']}
let g:ale_fix_on_save = 1
let g:ale_python_auto_pipenv=1

" lightline configuration
set laststatus=2
set noshowmode
set showtabline=2
set guioptions-=e
let g:lightline#bufferline#unnamed = "[NO NAME]"
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#number_separator = ": "
let g:lightline#bufferline#enable_devicons = 1
let g:lightline = {
	\ 'colorscheme': 'purify',
	\ 'active': {
	\   'left': [ [ 'mode', 'capslock', 'paste', 'fugitive' ],
	\	      [ 'readonly' ],
	\	      [ 'absolutepath', 'modified' ] ],
	\   'right': [ [ 'lineinfo' ],
	\	       [ 'percent' ],
	\	       [ 'filetype', 'fileencoding', 'fileformat' ] ]
	\ },
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'fugitive': 'LightlineFugitive',
	\		'capslock': 'CapslockStatusline'
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ 'tabline' : {
	\   'left': [ [ 'buffers' ] ],
	\   'right': [ [ 'devstatus', 'name' ] ]
	\ },
	\ 'component_expand': {
	\   'buffers': 'lightline#bufferline#buffers',
	\   'devstatus': 'Devstatus',
	\   'name': 'Name'
	\ },
	\ 'component_type': {
	\   'buffers': 'tabsel'
	\ },
	\ }
function! CapslockStatusline()
	if exists('*CapsLockStatusline')
		let capslock = CapsLockStatusline()
		return capslock !=# '' ? CapsLockStatusline() : ''
	endif
	return ''
endfunction
function! Devstatus()
	return 'dev'
endfunction
function! Name()
	return 'syahrulhamdani'
endfunction
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction

" fugitive configuration
nnoremap ,gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" configuration for NERDTree
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

" line highlighter
set cursorline

" show line numbers
set number relativenumber

" set tags
set tags=tags

" leader
let mapleader=","

" split configuration
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set UTF-8 support
set encoding=utf-8

" Mode settings
let &t_SI.="\e[5 q" " SI = INSERT Mode
let &t_EI.="\e[1 q" " EI = NORMAL Mode (ELSE)

" Manual VIM Highlight
match Title /[A-Z]\{2,\}/
