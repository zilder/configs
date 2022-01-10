execute pathogen#infect()

set t_Co=256
set background=dark
set number
set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype plugin indent on
syntax on

set colorcolumn=80

" use cscope databases with ctags
set cst

set hlsearch            " highlight search results
set clipboard=unnamedplus " use system clipboard
set mouse=a             " don't move cursor when using mousewheel


"hi User1 ctermbg=Blue ctermfg=White

set laststatus=2

"set statusline=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ ON\ AIR\ ':''}%*
"set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}%*
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}%*

set statusline+=\ ‹‹\ %t\ ››\        "tail of the filename
"set statusline+=[%{&ff}] "file format
set statusline+=%1*%m%*     "modified flag
set statusline+=%=          "left/right separator
set statusline+=%c:%l/%L    "cursor column:line/total lines
set statusline+=\ %P    "percent through file

nnoremap <leader>. :Tags<cr>
nnoremap <leader>p :Files<cr>

call plug#begin('~/.vim/plugged')

Plug 'ludovicchabant/vim-gutentags'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'nevans/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'dr-kino/cscope-maps'
Plug 'AndrewRadev/linediff.vim' " enables :LineDiff
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme brogrammer
" github theme
" let g:github_colors_soft = 1
" colorscheme github
" let g:airline_theme = "github"
" let g:lightline = { 'colorscheme': 'github' }

hi User1 ctermbg=red ctermfg=white
"hi ColorColumn ctermbg=lightgrey
"hi StatusLine ctermbg=black

"hi NormalColor guifg=Black guibg=Green ctermbg=46 ctermfg=0
hi InsertColor ctermbg=Red ctermfg=White
"hi ReplaceColor guifg=Black guibg=maroon1 ctermbg=165 ctermfg=0
hi VisualColor ctermbg=Blue ctermfg=White

" CoC configuration
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

let g:fzf_preview_window = []
