;; Free up my tmux prefix for viper. Suspend is always C-x C-z anyway.

(global-unset-key (kbd "C-z"))

;; Yes, yes, shut up.

(global-set-key (kbd "C-u") 'kill-to-beginning-of-line)
(global-set-key (kbd "C-x u") 'universal-argument)

;; I don't have access to M-TAB in my iTerm2 setup

(global-set-key (kbd "M-`") 'completion-at-point)
(global-set-key (kbd "C-c TAB") 'completion-at-point)

;; Everything else

(global-set-key (kbd "C-x M-f") 'find-file-at-point)
(global-set-key (kbd "C-x C-b") 'electric-buffer-list)
(global-set-key (kbd "C-x C-r") (if (fboundp 'helm-recentf) 'helm-recentf 'recentf-open-files))
(global-set-key (kbd "C-x M-s") 'speedbar-positioned)

(define-key minibuffer-local-map (kbd "M-p") 'previous-complete-history-element)
(define-key minibuffer-local-map (kbd "M-n") 'next-complete-history-element)
(define-key minibuffer-local-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-map (kbd "C-n") 'next-history-element)

(global-set-key (kbd "s-n") 'previous-buffer)
(global-set-key (kbd "s-p") 'next-buffer)
(global-set-key (kbd "s-k") 'kill-this-buffer)
(windmove-default-keybindings 'meta)

(global-set-key (kbd "M-;") 'comment-toggle-line)
(global-set-key (kbd "C-;") 'comment-indent)

;; Don't need movement by pages

(global-set-key (kbd "C-x [") 'kmacro-start-macro)
(global-set-key (kbd "C-x ]") 'kmacro-end-macro)

;; Info is weird

(with-eval-after-load 'info
  (define-key Info-mode-map (kbd "M-n") 'next-buffer))

;; Server

(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (local-set-key (kbd "C-c C-c") 'server-edit)))
