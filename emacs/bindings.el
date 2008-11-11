(global-set-key (kbd "C-x M-f") 'find-file-at-point)
(global-set-key (kbd "C-x C-b") 'electric-buffer-list)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x M-s") 'speedbar-positioned)

(global-set-key (kbd "M-n") 'cyclebuffer-forward)
(global-set-key (kbd "M-p") 'cyclebuffer-backward)

(global-set-key (kbd "C-.") 'call-last-kbd-macro)
(global-set-key (kbd "M-[") 'kmacro-start-macro)
(global-set-key (kbd "M-]") 'kmacro-end-macro)

(global-set-key (kbd "M-;") 'comment-toggle-line)
(global-set-key (kbd "C-;") 'comment-indent)
