(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))
(add-to-list 'auto-mode-alist '("shrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

(blink-cursor-mode -1)

(eval-after-load "coffee"
  (progn
    (defun coffee-custom ()
      (set (make-local-variable 'tab-width) 2))
    (add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))))

(column-number-mode 1)

(setq dired-listing-switches "-alhoF")
(add-hook 'dired-mode-hook 'toggle-truncate-lines)

(eval-after-load "js"
  (progn
    (defun js-custom ()
      (when (and buffer-file-name (string-match ".json" buffer-file-name))
	(set (make-local-variable 'js-indent-level) 2)))
    (add-hook 'js-mode-hook '(lambda () (js-custom)))))

(when-bound (fringe-mode 3))

(setq haskell-indent-offset 2)

(eval-after-load "info"
  '(define-key Info-mode-map (kbd "M-n") 'next-buffer))

(setq js2-auto-indent-flag nil
      js2-mode-escape-quotes nil
      js2-cleanup-whitespace nil
      js2-enter-indents-newline nil
      js2-mirror-mode nil
      js2-mode-escape-quotes nil
      js2-mode-squeeze-spaces nil
      js2-rebind-eol-bol-keys nil)

(when (require-soft 'recentf)
  (recentf-mode t))

(when (require-soft 'savehist)
  (setq savehist-file "~/.emacs.d/var/history")
  (savehist-mode 1))

(when (require-soft 'saveplace)
  (setq save-place-file "~/.emacs.d/var/places.el")
  (setq-default save-place t))

(show-paren-mode 1)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(transient-mark-mode 0)

(setq viper-mode t
      viper-custom-file-name "~/.emacs.d/etc/viper.el")
(autoload 'viper-change-state-to-emacs "viper.elc")
(add-hook 'find-file-hook 'viper-change-state-to-emacs t)
(add-hook 'change-major-mode-hook 'viper-change-state-to-emacs t)
