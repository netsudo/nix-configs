"##########"
" vim-plug "
"##########"

call plug#begin('~/.nvim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'cuzzo/react-complete-me'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'ervandew/supertab'
Plug 'garbas/vim-snipmate' | Plug 'marcweber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lvht/fzf-mru'
Plug 'majutsushi/tagbar'
Plug 'nvie/vim-flake8'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'simnalamburt/vim-mundo'
Plug 'travitch/hasksyn'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/tcomment'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * NERDTree | wincmd p
autocmd FileType html setlocal shiftwidth=2 tabstop=2
:let g:NERDTreeWinSize=20

set tabstop=4
set shiftwidth=4
set noexpandtab
set number
set wrap
set linebreak
set clipboard=unnamedplus

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:airline_powerline_fonts = 1
let g:jsx_highlight = 0
let g:vim_jsx_pretty_colorful_config = 1

" Assign a leader:
let mapleader = " "
let g:mapleader = " "

" FZF:
map <leader>t :FZF <CR>
" FZF.vim:
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --no-messages: Prevent rg from sassing.
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --no-messages --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
map <leader>f :Find 
