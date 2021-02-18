nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>gw :Gw<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Visual Mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

" Moving around, tabs, windows, and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader><cr> :noh<cr>

map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tt :tabonly<cr>

map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Spell Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ss : setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

set spell

" Misc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>m mmHmt:%s/<C-v><cr>//ge<cr>'tzt'm
noremap <leader>mm :set ff=unix<cr>
map <leader>q :e ~/buffer<cr>
map <leader>x :e ~/buffer.md<cr>
map <leader>pp :setlocal paste!<cr>

vnoremap <C-c> :w !xclip -i -sel c<CR><CR>

" Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" turn terminal to normal mode with escape
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter * if &buftype == 'terminal' | :startinsert | endif | :set nospell

" Shell Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbr gst Gst

" Turn persistent undo on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.nvim/temp_dirs/undodir
  set undofile
catch
endtry

" Command Line Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on command line
cno $h e ~/
cno $d e ~/Desktop
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super usefule when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
set termguicolors
colorscheme onedark
set encoding=utf8
set ffs=unix,dos,mac

if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:background = { "gui": "#282C34", "cterm": "235", "cterm16": "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background })
  augroup END
endif
