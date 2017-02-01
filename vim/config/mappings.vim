" readline-ish vim
" ----------------------------------------------------------------------------
"
" This is not an 'Emacs'-like mode. TODO: full writeup.

" ----------------------------------------------------------------------------

" Make sure that meta keys work when they are sent as <Esc> plus the key.

set esckeys timeout timeoutlen=500 ttimeoutlen=10

" Fight me
inoremap <Esc> <C-o>:echo "Use Ctrl-C, not ESC"<CR>

for c in ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "*", ""]
  exec "set <M-".c.">=\e".c
  "exec "imap \e".c." <M-"c.">"
endfor

" Opens the command-line window thing. Set to <C-f> by default, but we want to
" use that. Actually changes the key (it's not a mapping), so mappings must
" include it literally in the RHS.

set cedit=<C-x><C-e>

" Bindings! For each one that steps on a builtin key, this will note what
" functionality is shadowed and how we deal with it.

" [n] normally increments number at cursor; move to <Leader>a
" [i] normally inserts previously inserted text; not needed
" [c] normally inserts all matches; map <M-*> instead
nnoremap <C-a> <Home>
vnoremap <C-a> <Home>
inoremap <C-a> <Home>
cnoremap <C-a> <Home>
" [n] normally scrolls down a line; use other movement commands
" [i] normally inserts the character below cursor; don't use this
" [c] is already end of line, but include for symmetry
nnoremap <C-e> <End>
vnoremap <C-e> <End>
inoremap <C-e> <End>
cnoremap <C-e> <End>
" [i] normally pops up keyword completion, next match; FIXME
" [c] if after wildchar match, goes to next match; use wildmenu instead
nnoremap <C-n> <Down>
vnoremap <C-n> <Down>
inoremap <C-n> <Down>
cnoremap <C-n> <Down>
" [i] normally pops up keyword completion, prev match; FIXME
" [c] if after wildchar match, goes to prev match; use wildmenu instead
nnoremap <C-p> <Up>
vnoremap <C-p> <Up>
inoremap <C-p> <Up>
cnoremap <C-p> <Up>
" [cmdline] normally beginning of line; use C-a
nnoremap <C-b> <Left>
vnoremap <C-b> <Left>
inoremap <C-b> <Left>
cnoremap <C-b> <Left>
" Normally used for cedit (open cmd window); use q: instead
nnoremap <C-f> <Right>
vnoremap <C-f> <Right>
inoremap <C-f> <Right>
cnoremap <C-f> <Right>
" Meta key; not normally used.
nnoremap <M-f> e<Right>
vnoremap <M-f> e<Right>
inoremap <M-f> <C-o>e<Right>
cnoremap <M-f> <C-o>e<Right>
" Meta key; not normally used
nnoremap <M-b> <C-Left>
vnoremap <M-b> <C-Left>
inoremap <M-b> <C-Left>
cnoremap <M-b> <C-Left>
" [c] normally shows all matches in temp overlay window; use wildmenu instead
inoremap <C-d> <Del>
cnoremap <C-d> <Del>
" Meta keys; not normally used
inoremap <M-> <C-w>
cnoremap <M-> <C-w>

" Remember, <C-x><C-e> here is cedit
cnoremap <C-r> <C-x><C-e>
cnoremap <C-s> <C-x><C-e>
cnoremap <C-k> <C-x><C-e>d$<C-c><End>
cnoremap <C-y> <C-r><C-o>"
"cnoremap <M-w> <C-y>

cnoremap <M-*> <C-a>

cnoremap <C-g> <C-c>

" As mentioned above, <C-a> for beginning of line conflicts with these, so
" move them both to leader
nnoremap <Leader>a <C-a>
nnoremap <Leader>x <C-x>

123

inoremap <C-_> <C-o>u

" The classic vi behavior of SPC is not that useful. Is this better?
nnoremap <Space> <C-f>

inoremap <M-x> <C-o>:

nnoremap <M-q> gqap
inoremap <M-q> <C-o>gqap

nnoremap <C-h>f :help<Space>
inoremap <C-h>f <C-o>:help<Space>

" All searches are regexp searches
inoremap <C-s> <C-o>/
inoremap <C-M-s> <C-o>/
inoremap <C-r> <C-o>?
inoremap <C-M-r> <C-o>?

inoremap <M-g><M-n> <C-o>:cnext<CR>
inoremap <M-g><M-p> <C-o>:cprevious<CR>

" --- window mgmt, might as well

inoremap <C-x>2 <C-o><C-w>s
inoremap <C-x>3 <C-o><C-w>v
inoremap <C-x>0 <C-o><C-w>c
inoremap <C-x>1 <C-o><C-w>o
inoremap <C-x>o <C-o><C-w>w
inoremap <C-Tab> <C-o><C-w>w
inoremap <C-S-Tab> <C-o><C-w>W
inoremap <C-x>+ <C-o><C-w>=

" --- these seem too emacsy

"inoremap <C-x>c <C-o>:confirm qall<CR>
"inoremap <C-x><C-c> <C-o>:confirm qall<CR>
"inoremap <C-x><C-f> <C-o>:hide edit<Space>
"inoremap <C-x><C-s> <C-o>:update<CR>
"inoremap <C-x><C-v> <C-o>:bdelete edit<Space>

"inoremap <C-x>s <C-o>:wall<CR>
"inoremap <C-x>i <C-o>:read<Space>
"inoremap <C-x><C-w> <C-o>:write<Space>
"inoremap <C-x>b <C-o>:buffers<CR>
"inoremap <C-x><C-b> <C-o>:buffers<CR>
"inoremap <C-x>k <C-o>:bdelete<CR>

" -- unrelated stuff.

nmap <leader>q O%<Esc>O<Tab>--<Esc>O<C-u>
nmap <leader>/ :set hlsearch!<CR>
nmap <leader>n :nohlsearch<CR>
nmap <F7> :w<CR>:!aspell check %<CR>:e %<CR>
