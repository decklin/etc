set compatible
set backspace=indent,eol
set viminfo='20,<50,s10,h,n~/.vim/viminfo

set ttyfast errorbells
set report=1 showcmd
set modeline showmode ruler laststatus=2
set showmatch matchtime=5
set shortmess=finxotTI

set textwidth=78
set tabstop=8
set expandtab smarttab
set shiftwidth=4
set cinoptions=(s+s
set nojoinspaces
set ignorecase smartcase
set list listchars=tab:→\ ,trail:░,extends:»,precedes:«

set background=dark
set pastetoggle=<F11>
set wildchar=<Tab>
set more
set history=50

set directory=~/tmp,/var/tmp,/tmp

nmap ,f gqap
nmap ,q O%<Esc>O<Tab>--<Esc>O<C-u>
nmap ,/ :set hlsearch!<CR>
nmap <F7> :w<CR>:!aspell check %<CR>:e %<CR>

if has("syntax")
  syn on
endif

hi clear SpecialKey
hi clear NonText
hi clear Directory
hi clear ErrorMsg
hi clear IncSearch
hi clear Search
hi clear MoreMsg
hi clear ModeMsg
hi clear LineNr
hi clear Question
hi clear StatusLine
hi clear StatusLineNC
hi clear VertSplit
hi clear Title
hi clear Visual
hi clear VisualNOS
hi clear WarningMsg
hi clear WildMenu
hi clear Folded
hi clear FoldColumn
hi clear DiffAdd
hi clear DiffChange
hi clear DiffDelete
hi clear DiffText
hi clear SignColumn
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi clear Pmenu
hi clear PmenuSel
hi clear PmenuSbar
hi clear PmenuThumb
hi clear TabLine
hi clear TabLineSel
hi clear TabLineFill
hi clear CursorColumn
hi clear CursorLine
hi clear MatchParen
hi clear Comment
hi clear Constant
hi clear Special
hi clear Identifier
hi clear Statement
hi clear PreProc
hi clear Type
hi clear Underlined
hi clear Ignore
hi clear Error
hi clear Todo

hi SpecialKey cterm=NONE ctermfg=4
hi NonText cterm=NONE ctermfg=6
hi Directory cterm=NONE ctermfg=12
hi ErrorMsg cterm=NONE cterm=standout ctermfg=9 ctermbg=1
hi IncSearch cterm=NONE ctermbg=2
hi Search cterm=NONE ctermbg=2
hi MoreMsg cterm=NONE ctermbg=4
hi ModeMsg cterm=NONE ctermbg=0
hi LineNr cterm=NONE ctermfg=6
hi Question cterm=NONE ctermbg=5
hi StatusLine cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit cterm=reverse
hi Title ctermfg=13
hi Visual cterm=NONE ctermbg=0
hi VisualNOS cterm=NONE ctermbg=0
hi WarningMsg cterm=standout ctermfg=13 ctermbg=5
hi WildMenu ctermfg=7 ctermbg=2
hi Folded cterm=standout ctermfg=14 ctermbg=6
hi FoldColumn cterm=standout ctermfg=14 ctermbg=6
hi DiffDelete cterm=bold ctermfg=9
hi DiffChange cterm=bold ctermfg=5
hi DiffAdd cterm=bold ctermfg=12
hi DiffText cterm=NONE
hi SpellBad cterm=NONE ctermbg=1
hi MatchParen cterm=NONE ctermfg=9
hi Comment cterm=NONE ctermfg=14
hi Constant cterm=NONE ctermfg=13
hi Special cterm=NONE ctermfg=9
hi Identifier cterm=NONE ctermfg=12
hi Statement cterm=NONE ctermfg=10
hi PreProc cterm=NONE ctermfg=8
hi Type cterm=NONE ctermfg=11
hi Underlined cterm=underline
hi Ignore cterm=NONE ctermfg=0
hi Error cterm=NONE ctermfg=9 ctermbg=1

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
