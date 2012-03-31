set backupdir=~/.vim/bak//
set directory=~/.vim/tmp//
set viminfo='20,<50,s10,h,n~/.vim/viminfo

set hidden

set textwidth=78
set tabstop=8
set expandtab smarttab
set backspace=indent,eol
set shiftwidth=4
set cinoptions=(s+s
set nojoinspaces
set ignorecase smartcase
set list listchars=tab:-\ ,trail:_,extends:>,precedes:<

if $TERM == "vt100"
  set noruler
else
  set ruler ttyfast errorbells report=1 showcmd
endif

set showmatch matchtime=5
set shortmess=finxotTI
set showmode laststatus=2
set background=dark
set pastetoggle=<F11>
set wildchar=<Tab>
set history=50 more

if has("eval")
  let mapleader = ","
  let MRU_File = expand("~/.vim/mru_files")
end

nmap <leader>R :MRU<CR>
nmap <leader>f gqap
nmap <leader>q O%<Esc>O<Tab>--<Esc>O<C-u>
nmap <leader>/ :set hlsearch!<CR>
nmap <F7> :w<CR>:!aspell check %<CR>:e %<CR>

if has("syntax")
  syn on
  let g:is_posix = 1
endif
if has("folding")
  set foldlevel=99
endif

"hi clear SpecialKey
"hi clear NonText
"hi clear Directory
"hi clear ErrorMsg
"hi clear IncSearch
"hi clear Search
"hi clear MoreMsg
"hi clear ModeMsg
"hi clear LineNr
"hi clear Question
"hi clear StatusLine
"hi clear StatusLineNC
"hi clear VertSplit
"hi clear Title
"hi clear Visual
"hi clear VisualNOS
"hi clear WarningMsg
"hi clear WildMenu
"hi clear Folded
"hi clear FoldColumn
"hi clear DiffAdd
"hi clear DiffChange
"hi clear DiffDelete
"hi clear DiffText
"hi clear SignColumn
"hi clear SpellBad
"hi clear SpellCap
"hi clear SpellRare
"hi clear SpellLocal
"hi clear Pmenu
"hi clear PmenuSel
"hi clear PmenuSbar
"hi clear PmenuThumb
"hi clear TabLine
"hi clear TabLineSel
"hi clear TabLineFill
"hi clear CursorColumn
"hi clear CursorLine
"hi clear MatchParen
"hi clear Comment
"hi clear Constant
"hi clear Special
"hi clear Identifier
"hi clear Statement
"hi clear PreProc
"hi clear Type
"hi clear Underlined
"hi clear Ignore
"hi clear Error
"hi clear Todo
"
"hi SpecialKey term=NONE cterm=NONE ctermfg=4
"hi NonText term=NONE cterm=NONE ctermfg=6
"hi Directory term=NONE cterm=NONE ctermfg=12
"hi ErrorMsg term=standout cterm=standout ctermfg=9 ctermbg=1
"hi IncSearch term=NONE cterm=NONE ctermbg=2
"hi Search term=NONE cterm=NONE ctermbg=2
"hi MoreMsg term=NONE cterm=NONE ctermbg=4
"hi ModeMsg term=NONE cterm=NONE ctermbg=0
"hi LineNr term=NONE cterm=NONE ctermfg=6
"hi Question term=NONE cterm=NONE ctermbg=5
"hi StatusLine term=bold,reverse cterm=bold,reverse
"hi StatusLineNC term=reverse cterm=reverse
"hi VertSplit term=reverse cterm=reverse
"hi Title term=NONE cterm=NONE ctermfg=13
"hi Visual term=NONE cterm=NONE ctermbg=0
"hi VisualNOS term=NONE cterm=NONE ctermbg=0
"hi WarningMsg term=standout cterm=standout ctermfg=13 ctermbg=5
"hi WildMenu term=NONE cterm=NONE ctermfg=7 ctermbg=2
"hi Folded term=standout cterm=standout ctermfg=14 ctermbg=6
"hi FoldColumn term=standout cterm=standout ctermfg=14 ctermbg=6
"hi DiffDelete term=bold cterm=bold ctermfg=9
"hi DiffChange term=bold cterm=bold ctermfg=5
"hi DiffAdd term=bold cterm=bold ctermfg=12
"hi DiffText term=NONE cterm=NONE
"hi SpellBad term=NONE cterm=NONE ctermbg=1
"hi MatchParen term=NONE cterm=NONE ctermfg=9
"hi Comment term=NONE cterm=NONE ctermfg=14
"hi Constant term=NONE cterm=NONE ctermfg=13
"hi Special term=NONE cterm=NONE ctermfg=9
"hi Identifier term=NONE cterm=NONE ctermfg=12
"hi Statement term=NONE cterm=NONE ctermfg=10
"hi PreProc term=NONE cterm=NONE ctermfg=8
"hi Type term=NONE cterm=NONE ctermfg=11
"hi Underlined term=underline cterm=underline
"hi Ignore term=NONE cterm=NONE ctermfg=0
"hi Error term=NONE cterm=NONE ctermfg=9 ctermbg=1

hi link mailSubject Identifier

if has("title")
    set title titlelen=256
    let &titlestring="vim@" . hostname() . ": %f %y"
endif

if has("cindent")
    let xdefaults_no_if0 = 1
    let c_syntax_for_h = 1
    let c_space_errors = 1
    let c_gnu = 1
    let perl_want_scope_in_variables = 1
    let perl_include_POD = 1
    let perl_extended_vars = 1
endif

if has("eval")
    function! StartMail()
        if search("X-Tags: unfiled")
            g/^\(Cc\|Bcc\|Reply-To\):/d
            setlocal ft=rstmail
            setlocal tw=72 sw=4 et
        endif
    endf
endif

if has("autocmd")
    augroup decklin
        au FileType mail exe StartMail()
        au FileType perl setlocal cinkeys-=0#
        au FileType text,mail,rst,rstmail,procmail setlocal tw=72 sw=4 et
        au FileType c,sh,perl,python,empy setlocal tw=78 sw=4 et
        au FileType ruby,vim setlocal tw=78 sw=2 et
        au FileType apache,css,javascript setlocal tw=78 sw=4 et
        au FileType html,xhtml,wml,xml setlocal tw=78 sw=2 et noai
        au FileType remind setlocal tw=78 sw=4 et
        au FileType svn setlocal tw=78 sw=2 et
        au BufNewFile,BufRead *.txt setlocal ft=text
        au BufNewFile,BufRead DESIGN setlocal ft=text
        au BufNewFile,BufRead LICENSE setlocal ft=text
        au BufNewFile,BufRead NEWS setlocal ft=text
        au BufNewFile,BufRead INSTALL setlocal ft=text
        au BufNewFile,BufRead README setlocal ft=text
        au BufNewFile,BufRead TODO setlocal ft=text
        au BufNewFile,BufRead */proj/*/[A-Z]*[A-Z] setlocal ft=rst
        au BufNewFile,BufRead *.xhtml setlocal ft=xhtml
        au BufNewFile,BufRead *.dpatch setlocal ft=diff
        au BufNewFile,BufRead *.rem setlocal ft=remind
        au BufNewFile,BufRead *.empy setlocal ft=empy
        au BufNewFile,BufRead */rawdog/*/config setlocal ft=conf
        au BufNewFile,BufRead */apache2/sites-*/* setlocal ft=apache
        au BufNewFile,BufRead .xscreensaver setlocal ft=xdefaults
        au BufNewFile,BufRead */debian/*.init.d setlocal ft=sh
        au BufNewFile,BufRead Rakefile setlocal ft=ruby
        au BufNewFile,BufRead runlevel.conf setlocal tw=78 sw=8
        au BufNewFile,BufRead pygmy*.*,bantu.* setlocal noet ts=4 tw=0
        au BufNewFile,BufRead rawdog.py setlocal noet ts=4
        au BufNewFile,BufRead crontab setlocal tw=0
        au BufNewFile,BufRead presence.txt setlocal tw=0
        au BufNewFile,BufRead debian-women.txt setlocal tw=0
        au BufNewFile,BufRead */quotes/*.txt setlocal tw=0
    augroup END
endif

" Emacs keys that are burned into my muscle memory, based on vimacs-0.93,
" but highly simplified (tweaked keys, no configuration, no new functions).
" Only the basics; this is still vi.

inoremap <M-x> <C-o>:

inoremap <M-1> <C-o>1
inoremap <M-2> <C-o>2
inoremap <M-3> <C-o>3
inoremap <M-4> <C-o>4
inoremap <M-5> <C-o>5
inoremap <M-6> <C-o>6
inoremap <M-7> <C-o>7
inoremap <M-8> <C-o>8
inoremap <M-9> <C-o>9

inoremap <C-x><C-c> <C-o>:confirm qall<CR>
inoremap <C-x><C-f> <C-o>:hide edit<Space>
inoremap <C-x><C-s> <C-o>:update<CR>
inoremap <C-x><C-v> <C-o>:bdelete edit<Space>
inoremap <C-x>s <C-o>:wall<CR>
inoremap <C-x>i <C-o>:read<Space>
inoremap <C-x><C-w> <C-o>:write<Space>
inoremap <C-x>b <C-o>:buffers<CR>
inoremap <C-x><C-b> <C-o>:buffers<CR>
inoremap <C-x>k <C-o>:bdelete<CR>

inoremap <C-h><C-h> <C-o>:help<CR>

inoremap <C-_> <C-o>u

inoremap <C-s> <C-o>/
inoremap <C-M-s> <C-o>/
inoremap <C-r> <C-o>?
inoremap <C-M-r> <C-o>?
inoremap <M-g><M-n> <C-o>:cnext<CR>
inoremap <M-g><M-p> <C-o>:cprevious<CR>
inoremap <M-s> <C-o>:set invhls<CR>
cnoremap <C-r> <CR><C-o>?<Up>

cnoremap <C-b> <Left>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-f> <Right>
cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-y> <C-r><C-o>"
cnoremap <M-w> <C-y>
cnoremap <M-BS> <C-w>
cnoremap <C-k> <C-f>d$<C-c><End>
imap <C-b> <Left>
vmap <C-b> <Left>
omap <C-b> <Left>
imap <C-f> <Right>
vmap <C-f> <Right>
omap <C-f> <Right>
imap <C-p> <Up>
vmap <C-p> <Up>
omap <C-p> <Up>
imap <C-n> <Down>
vmap <C-n> <Down>
omap <C-n> <Down>
inoremap <M-f> <C-o>e<Right>
vnoremap <M-f> e<Right>
onoremap <M-f> e<Right>
inoremap <M-b> <C-Left>
vnoremap <M-b> <C-Left>
onoremap <M-b> <C-Left>
imap <C-a> <Home>
vmap <C-a> <Home>
omap <C-a> <Home>
imap <C-e> <End>
vmap <C-e> <End>
omap <C-e> <End>
inoremap <M-a> <C-o>(
vnoremap <M-a> (
onoremap <M-a> (
inoremap <M-e> <C-o>)
vnoremap <M-e> )
onoremap <M-e> )
inoremap <C-d> <Del>
vnoremap <C-d> <Del>
onoremap <C-d> <Del>
inoremap <M-<> <C-o>1G<C-o>0
vnoremap <M-<> 1G0
onoremap <M-<> 1G0
inoremap <M->> <C-o>G<C-o>$
vnoremap <M->> G$
onoremap <M->> G$
inoremap <C-v> <PageDown>
vnoremap <C-v> <PageDown>
onoremap <C-v> <PageDown>
inoremap <M-v> <PageUp>
vnoremap <M-v> <PageUp>
onoremap <M-v> <PageUp>
inoremap <M-m> <C-o>^
vnoremap <M-m> ^
onoremap <M-m> ^
inoremap <C-x>= <C-g>
vnoremap <C-x>= <C-g>
onoremap <C-x>= <C-g>
inoremap <silent> <M-g><M-g> <C-o>G
vnoremap <silent> <M-g><M-g> G
onoremap <silent> <M-g><M-g> G
inoremap <M-Left> <S-Left>
vnoremap <M-Left> <S-Left>
onoremap <M-Left> <S-Left>
inoremap <M-Right> <S-Right>
vnoremap <M-Right> <S-Right>
onoremap <M-Right> <S-Right>
inoremap <C-Up> <C-o>{
vnoremap <C-Up> {
onoremap <C-Up> {
inoremap <C-Down> <C-o>}
vnoremap <C-Down> }
onoremap <C-Down> }

inoremap <C-u> <C-o>d0
inoremap <C-q> <C-v>
inoremap <C-^> <C-y>
inoremap <M-r> <C-r>=

cnoremap <C-g> <C-c>
onoremap <C-g> <C-c>

inoremap <C-d> <Del>
inoremap <M-d> <C-o>dw
inoremap <M-> <C-w>
inoremap <M-BS> <C-w>
inoremap <C-BS> <C-w>
inoremap <M-0><C-k> <C-o>d0
inoremap <M-k> <C-o>d)
inoremap <C-x><BS> <C-o>d(
inoremap <M-z> <C-o>dt
inoremap <M-\> <Esc>beldwi

inoremap <C-x>2 <C-o><C-w>s
inoremap <C-x>3 <C-o><C-w>v
inoremap <C-x>0 <C-o><C-w>c
inoremap <C-x>1 <C-o><C-w>o
inoremap <C-x>o <C-o><C-w>w
inoremap <C-Tab> <C-o><C-w>w
inoremap <C-S-Tab> <C-o><C-w>W
inoremap <C-x>+ <C-o><C-w>=

inoremap <M-q> <C-o>gqap
inoremap <script> <C-o> <CR><Left>
inoremap <M-^> <Up><End><C-o>J
vnoremap <C-M-\> =
vnoremap <C-x><Tab> =

inoremap <M-l> <C-o>gul<C-o>w
inoremap <M-u> <C-o>gUe<C-o>w
inoremap <M-c> <C-o>gUl<C-o>w

inoremap <C-t> <Left><C-o>x<C-o>p
inoremap <M-t> <Esc>dawbhpi

inoremap <M-.> <C-o><C-]>
inoremap <M-*> <C-o><C-t>
inoremap <C-x>4. <C-o><C-w>}

vnoremap <M-!> !
inoremap <M-!> <C-o>:!

vnoremap <C-x>r <C-v>

inoremap <C-l> <C-o>zz<C-o><C-l>
