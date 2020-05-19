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
Plug 'tell-k/vim-autopep8'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'simnalamburt/vim-mundo'
Plug 'elixir-editors/vim-elixir'
Plug 'travitch/hasksyn'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/tcomment'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-syntastic/syntastic'
call plug#end()

:let g:NERDTreeWinSize=20

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set wrap
set linebreak
set clipboard=unnamedplus

" Theme settings
syntax on
set background=dark
colorscheme solarized8
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

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

" Nerdtree
let g:NERDTreeWinSize=25
map <leader>j :NERDTreeToggle <CR>

" FZF:
map <leader>t :FZF <CR>
map <leader>g :Ag <CR>
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

autocmd Filetype haskell setlocal ts=2 sts=2 sw=2 expandtab

" Autopep8 settings
let g:autopep8_on_save = 1
let g:autopep8_aggressive=2
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'lint --'
