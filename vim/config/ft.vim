if has("autocmd")
    augroup decklin_filetypes
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
