(global-set-key (kbd "C-x M-f") 'find-file-at-point)
(global-set-key (kbd "C-x C-b") 'electric-buffer-list)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x M-s") 'speedbar-positioned)

(define-key minibuffer-local-map (kbd "M-p") 'previous-complete-history-element)
(define-key minibuffer-local-map (kbd "M-n") 'next-complete-history-element)
(define-key minibuffer-local-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-map (kbd "C-n") 'next-history-element)

(global-set-key (kbd "M-n") 'previous-buffer)
(global-set-key (kbd "M-p") 'next-buffer)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(windmove-default-keybindings 'shift)

(global-set-key (kbd "C-.") 'call-last-kbd-macro)
(global-set-key (kbd "M-[") 'kmacro-start-macro)
(global-set-key (kbd "M-]") 'kmacro-end-macro)

(global-set-key (kbd "M-;") 'comment-toggle-line)
(global-set-key (kbd "C-;") 'comment-indent)
