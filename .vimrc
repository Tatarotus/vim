call plug#begin('~/.vim/plugged')
"YCM - You Complete Me
Plug  'ycm-core/YouCompleteMe'
"Vim typescript
Plug 'leafgarland/typescript-vim'
" Vim Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Intellisense
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'
" File Sidebar
Plug 'preservim/nerdtree'
" Syntax Highliter
Plug 'sheerun/vim-polyglot'
" Auto Save
Plug 'vim-scripts/vim-auto-save'
" Emmet
Plug 'mattn/emmet-vim'
" Auto Pairs
Plug 'jiangmiao/auto-pairs'
" Pretty Cool Theme
Plug 'sainnhe/sonokai'
call plug#end()

"~~Theme~~
set termguicolors

let g:lightline = {'colorscheme' : 'sonokai'}
let g:airline_theme = 'sonokai'

" the configuration options should be placed before `colorscheme sonokai`
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai  

"~~Basic Settings~~
syntax on

"tab indentation
:set shiftwidth=2
:set autoindent
:set smartindent

"tab size
:set tabstop=2
:set shiftwidth=2
:set expandtab

"set line numbers
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"~~Plugin Conf~~


"vim-auto-save

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 
let g:auto_save_silent = 1  " do not display the auto-save notification

"Vim Refresh
nno <space>R :<c-u>call <sid>vim_quit_and_restart()<cr>
fu! s:vim_quit_and_restart() abort
    if has('gui_running') | echo 'not available in GUI' | return | endif
    sil! update
    sil call system('kill -USR1 $(ps -p '.getpid().' -o ppid=)')
    qa!
endfu

"~~Key Maps~~
"Youcompleteme
"Disable scratch preview
set completeopt-=preview

"nerdTree
nnoremap <space> :NERDTreeToggle <cr> 
nnoremap <PageUp> :bnext <cr>
nnoremap <PageDown> :bprevious <cr>
nnoremap <Del> :bd <cr>
"Prettier
nnoremap <cr> :Prettier <cr>
