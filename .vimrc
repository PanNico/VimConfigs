" Call the .vimrc.plug file
if filereadable(expand("~/.vim/vimrc.plug"))
    source ~/.vim/vimrc.plug
endif

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set cursorline
set title
set number
set encoding=utf-8
" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

syntax on

" Search for selected text, forwards or backwards.
" Press * to search forwards for selected text, or # to search backwards.
" As normal, press n for next search, or N for previous.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <S-t> :tabnew\<CR>

nnoremap <S-q> :qa<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>

nnoremap <C-o> :vsplit<CR>
nnoremap <C-p> :split<CR>
nnoremap <C-Left> :vertical resize -8<CR>
nnoremap <C-Right> :vertical resize +8<CR>
nnoremap <C-Down> :resize -8<CR>
nnoremap <C-Up> :resize +8<CR>
map <up> <C-w><up>
map <down> <C-w><down>
map <left> <C-w><left>
map <right> <C-w><right>

colorscheme onedark

"autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

let g:clang_format#auto_format = 1
