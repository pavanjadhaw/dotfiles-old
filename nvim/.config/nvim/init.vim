" Plugins
if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein')
	call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
	call dein#add('farmergreg/vim-lastplace')
	call dein#add('ntpeters/vim-better-whitespace')
	call dein#add('tpope/vim-repeat', { 'on_map' : '.'})
	call dein#add('tpope/vim-surround', { 'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('tpope/vim-unimpaired')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('mbbill/undotree', {'on_cmd': ['UndotreeToggle']})

  "" language
  call dein#add('sheerun/vim-polyglot')

	"" fuzzy finder
	call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
	call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

	"" color
	call dein#add('pavanjadhaw/plain')
	call dein#add('dylanaraps/wal.vim')

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

""" Coloring
syntax on
set background=dark
colorscheme wal

""" Other Configurations
filetype plugin indent on
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 noshowcmd noshowmode
set nobackup nowritebackup noswapfile
set dir=/tmp
set hidden
set wildmenu
set wrap breakindent
set encoding=utf-8
set number
set title

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
""" statusline
let g:currentmode={
			\ 'n'  : 'NORMAL ',
			\ 'no' : 'N·OPERATOR PENDING ',
			\ 'v'  : 'VISUAL ',
			\ 'V'  : 'V·LINE ',
			\ '' : 'V·BLOCK ',
			\ 's'  : 'SELECT ',
			\ 'S'  : 'S·LINE ',
			\ '' : 'S·BLOCK ',
			\ 'i'  : 'INSERT ',
			\ 'R'  : 'REPLACE ',
			\ 'Rv' : 'V·REPLACE ',
			\ 'c'  : 'COMMAND ',
			\ 'cv' : 'VIM EX ',
			\ 'ce' : 'EX ',
			\ 'r'  : 'PROMPT ',
			\ 'rm' : 'MORE ',
			\ 'r?' : 'CONFIRM ',
			\ '!'  : 'SHELL ',
			\ 't'  : 'TERMINAL '}

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
	let l:modecurrent = mode()
	" use get() -> fails safely, since ^V doesn't seem to register
	" 3rd arg is used when return of mode() == 0, which is case with ^V
	" thus, ^V fails -> returns 0 -> replaced with 'V Block'
	let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
	let l:current_status_mode = l:modelist
	return l:current_status_mode
endfunction

hi PrimaryBlock   ctermfg =00 ctermbg=03
hi SecondaryBlock ctermfg =07 ctermbg=10
hi Blanks         ctermfg =07 ctermbg=0

highlight EndOfBuffer ctermfg=black ctermbg=black

set statusline=
set statusline+=%#PrimaryBlock#
set statusline+=\ %{ModeCurrent()}
set statusline+=%#SecondaryBlock#
set statusline+=%{StatuslineGit()}
set statusline+=%#Blanks#
set statusline+=\ %t\ 
set statusline+=%(%m%)
set statusline+=%=
set statusline+=%#SecondaryBlock#
set statusline+=\ Ln
set statusline+=\ %l
set statusline+=,Col
set statusline+=\ %c\ 
set statusline+=%#PrimaryBlock#
set statusline+=\ %Y\ 

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

""" Custom Mappings
let mapleader=";"

" search mapping
nmap n :norm! nzzzv<CR>
nmap N :norm! Nzzzv<CR>

" Fast saving
nmap <leader>w :w!<cr>

"" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" fzf
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :History:<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>j :History<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>m :Maps<cr>
nnoremap <leader>r :Ag<cr>

""" Plugin Configurations

" Undotree
if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif

" fzf colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }
