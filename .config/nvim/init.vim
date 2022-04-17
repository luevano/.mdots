if has('nvim')
	" Neovim specific commands
else
	" Standard vim specific commands
endif

" Mutual commands after this
let mapleader=','
set showcmd
syntax enable

set background=dark
colorscheme dracula
highlight BadWhitespace ctermbg=red

set title
set encoding=utf-8
set number relativenumber
set cursorline
set clipboard+=unnamedplus

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set foldmethod=indent
set foldlevel=99

" es_mx not always supported
" set spelllang=es_mx,en_us
set spelllang=en_us
set showbreak=↪\
set listchars=eol:↲,nbsp:␣,tab:»\ ,trail:•,precedes:⟨,extends:⟩


" functions
" Toggle spellchecking
function! ToggleSpellCheck()
	set spell!
	if &spell
		echo "Spellcheck ON"
	else
		echo "Spellcheck OFF"
	endif
endfunction

" Toggle listchars
function! ToggleListChars()
	set list!
	if &list
		echo "Listchars ON"
	else
		echo "Listchars OFF"
	endif
endfunction

" keybindings
" reload vim
nmap <F5> :source ~/.config/nvim/init.vim<CR>

" toggle relative line number
nmap <F2> :set number invrelativenumber<CR>

" buffers
nnoremap gb :ls<CR>:buffer<Space>
nmap <Leader>a :badd<Space>
nmap <Leader>l :ls<CR>

" split navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-down> :resize +5<cr>
nnoremap <C-up> :resize -5<cr>
nnoremap <C-right> :vertical resize +5<cr>

" tab manipulation
nmap <Leader>t :tabe<CR>
nmap <Leader>y :tabclose<CR>

" enable folding with the spacebar
nnoremap <Space> za

" spell checking
nmap <Leader>s :call ToggleSpellCheck()<CR>

" listchars
nmap <Leader>c :call ToggleListChars()<CR>
