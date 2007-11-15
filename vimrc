set compatible
set backspace=indent,eol

set ttyfast errorbells
set report=1 showcmd
set modeline showmode ruler laststatus=2
set showmatch matchtime=5
set shortmess=finxotTI

set textwidth=78
set tabstop=8 hardtabs=8
set expandtab smarttab
set shiftwidth=4
set cinoptions=(s+s
set nojoinspaces
set ignorecase smartcase
set list listchars=tab:»\ ,trail:░,extends:≥,precedes:≤

set background=dark
set pastetoggle=<F11>
set wildchar=<Tab>
set more
set history=50

nmap ,f gqap
nmap ,q O%<Esc>O<Tab>--<Esc>O<C-u>
nmap ,/ :set hlsearch!<CR>
nmap <F7> :w<CR>:!aspell check %<CR>:e %<CR>

hi SpecialKey ctermfg=4
hi NonText ctermfg=6
hi Directory cterm=bold ctermfg=4
hi ErrorMsg cterm=bold,standout ctermfg=1 ctermbg=0
hi IncSearch cterm=reverse ctermfg=3 ctermbg=15
hi Search cterm=reverse ctermfg=3 ctermbg=15
hi MoreMsg cterm=bold ctermfg=2
hi ModeMsg cterm=bold ctermfg=5
hi LineNr ctermfg=6
hi Question cterm=bold ctermfg=5
hi StatusLine cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit cterm=reverse
hi Title cterm=bold ctermfg=5
hi Visual cterm=reverse ctermbg=82
hi WarningMsg cterm=standout ctermfg=74 ctermbg=15
hi WildMenu ctermfg=7 ctermbg=2
hi Folded cterm=standout ctermfg=14 ctermbg=82
hi FoldColumn cterm=standout ctermfg=14 ctermbg=82
hi DiffAdd cterm=bold ctermbg=4
hi DiffChange cterm=bold ctermbg=5
hi DiffDelete cterm=bold ctermfg=12 ctermbg=6
hi DiffText cterm=reverse cterm=bold ctermbg=9
hi Pmenu ctermbg=13
hi PmenuSel ctermbg=82
hi PmenuSbar ctermbg=84
hi PmenuThumb cterm=reverse
hi TabLine cterm=underline cterm=underline ctermfg=15 ctermbg=82
hi TabLineSel cterm=bold cterm=bold
hi TabLineFill cterm=reverse cterm=reverse
hi MatchParen cterm=reverse ctermbg=6
hi Todo cterm=standout ctermfg=7 ctermbg=4
hi Identifier cterm=underline cterm=bold ctermfg=4
hi Statement cterm=bold cterm=bold ctermfg=2
hi Type cterm=underline cterm=bold ctermfg=3
hi PreProc cterm=underline cterm=bold ctermfg=5

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
    function StartMail()
        if search("X-Tags: BLOGMAIL")
            silent! /^X-Tags:/s/BLOGMAIL//
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
        au FileType text,mail,rst,rstmail setlocal tw=72 sw=4 et
        au FileType c,sh,perl,python,empy setlocal tw=78 sw=4 et
        au FileType ruby,vim,apache,css setlocal tw=78 sw=4 et
        au FileType procmail,javascript setlocal tw=78 sw=4 et
        au FileType html,xhtml,wml,xml setlocal tw=78 sw=2 et noai
        au FileType svn setlocal tw=78 sw=2 et
        au FileType remind setlocal tw=78 sw=4 et
        au BufNewFile,BufRead *.txt setlocal ft=text
        au BufNewFile,BufRead DESIGN setlocal ft=text
        au BufNewFile,BufRead LICENSE setlocal ft=text
        au BufNewFile,BufRead NEWS setlocal ft=text
        au BufNewFile,BufRead INSTALL setlocal ft=text
        au BufNewFile,BufRead README setlocal ft=text
        au BufNewFile,BufRead TODO setlocal ft=text
        au BufNewFile,BufRead */proj/*/[A-Z]* setlocal ft=rst
        au BufNewFile,BufRead *.xhtml setlocal ft=xhtml
        au BufNewFile,BufRead *.dpatch setlocal ft=diff
        au BufNewFile,BufRead *.rem setlocal ft=remind
        au BufNewFile,BufRead *.empy setlocal ft=empy
        au BufNewFile,BufRead */rawdog/*/config setlocal ft=conf
        au BufNewFile,BufRead */apache2/sites-*/* setlocal ft=apache
        au BufNewFile,BufRead .xscreensaver setlocal ft=xdefaults
        au BufNewFile,BufRead */debian/*.init.d setlocal ft=sh
        au BufNewFile,BufRead runlevel.conf setlocal tw=78 sw=8
        au BufNewFile,BufRead pygmy*.*,bantu.* setlocal noet ts=4 tw=0
        au BufNewFile,BufRead rawdog.py setlocal noet ts=4
        au BufNewFile,BufRead crontab setlocal tw=0
        au BufNewFile,BufRead presence.txt setlocal tw=0
        au BufNewFile,BufRead debian-women.txt setlocal tw=0
        au BufNewFile,BufRead */quotes/*.txt setlocal tw=0
    augroup END
endif
