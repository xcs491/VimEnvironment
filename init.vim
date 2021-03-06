if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'posva/vim-vue'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'nightsense/carbonized'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'ambv/black'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript','css','scss','json','vue','html'] }
Plug 'wakatime/vim-wakatime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'severin-lemaignan/vim-minimap'

call plug#end()

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" let g:user_emmet_settings = {'html':{'block_all_childless': 1,
" 'inline_elements': 'one,two', 'block_elements': 'div,aside'}}
let g:user_emmet_settings = {'html':{'block_all_childless': 1}}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

set relativenumber

map <C-p> :Files<CR>


fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' ' 

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()

set rtp+=~/.fzf
set shiftwidth=4

let g:user_emmit_settings = {'html':{'block_all_childless':1}}
let g:python3_host_prog='/usr/local/opt/python@3.7/bin/python3.7'
let g:deoplete#enable_at_startup = 1
let g:black_virtualenv = '/Users/keithk/gits/blackenv'

set cursorline
set cursorcolumn

set ignorecase

nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

set expandtab
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1

let g:prettier#config#tab_width = 4

nnoremap <silent> <C-i> :Buffers<cr>
noremap <A-i> :BLines<cr>
noremap Zz <c-w>_\|<c-w>\|
noremap Zo <c-w>=
noremap <Leader>o <c-w>_\|<c-w>\|
noremap <A-o> <c-w>_\|<c-w>\|
noremap <Leader>u <c-w>=
noremap <A-u> <c-w>=
noremap L <c-w>l
noremap H <c-w>h
noremap <A-w> <c-w>v
noremap <Leader>q <c-w>v
nnoremap <esc> :noh<return><esc>

map <Leader>t :NERDTreeToggle<CR>

set hidden

:imap jj <Esc>

nnoremap <Leader>w :update<cr>
inoremap <Leader>w <Esc>:update<cr>
inoremap OO <Esc>O
inoremap AA <Esc>A
inoremap II <Esc>I
inoremap DD <Esc>dd
inoremap UU <Esc>u
inoremap Oo <Esc>o
inoremap Cc <Esc>cc
inoremap $$ <Esc>$
inoremap ^^ <Esc>^
inoremap ZZ <Esc>ZZ
inoremap ZQ <Esc>ZQ
inoremap caw <Esc>caw

set foldmethod=indent

hi SpellBad ctermfg=red ctermbg=None cterm=underline

set clipboard=unnamed
