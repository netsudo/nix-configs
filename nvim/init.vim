"##########"
" vim-plug "
"##########"

call plug#begin('~/.nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'cuzzo/react-complete-me'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/git-messenger.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'honza/vim-snippets'
call plug#end()

" Set colorscheme
set termguicolors     " enable true colors support
let ayucolor="dark"
colorscheme ayu
autocmd ColorScheme * hi CocMenuSel ctermbg=237 guibg=#13354A
autocmd ColorScheme * call Highlight()
function! Highlight() abort
  hi Conceal ctermfg=239 guifg=#504945
  hi CocSearch ctermfg=12 guifg=#18A3FF
endfunction
autocmd vimenter * ++nested colorscheme ayu
set signcolumn=auto:2

" Elixir Syntax Highlighting
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" Space settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set wrap
set linebreak
set clipboard=unnamedplus

" Set terminal title
set title

filetype plugin indent on
autocmd FileType elixir let b:coc_root_patterns = ['.git', '.env']

" Swap file settings
set noswapfile
set backupcopy=yes

" Assign a leader:
let mapleader = " "
let g:mapleader = " "

" Remove mouse
set mouse=

" Remaps
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map ,d "_d_<CR>
map <leader>z :noh<CR>

" Theme settings
syntax on
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
hi default

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Powerline
let g:jsx_highlight = 0
let g:vim_jsx_pretty_colorful_config = 1
let g:airline_powerline_fonts = 1

" COC Settings
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300

if has("patch-8.1.1564")
"Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

""" ~# Coc Settings

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)

" Nerdtree
let g:NERDTreeWinSize=25
map <leader>o :NERDTreeToggle \| wincmd l<CR>
map <leader>n :NERDTreeFind <CR>
" Focus current file
let g:NERDTreeHighlightCursorline = 1
let g:nerdtree_sync_cursorline = 1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Git Messenger
map <leader>i :GitMessenger <CR>

" FZF:
map <leader>t :FZF <CR>
map <leader>g :Rg <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>s :BLines<CR>
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
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Haskell Indentation
autocmd Filetype haskell setlocal ts=2 sts=2 sw=2 expandtab

" Autopep8 settings
let g:autopep8_on_save = 0
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

" Spell checking
augroup setSpelling
  autocmd!

  autocmd FileType gitcommit setlocal spell spelllang=en_us
  autocmd FileType markdown setlocal spell spelllang=en_us
augroup END
