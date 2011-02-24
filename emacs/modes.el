;; Make sure to start viper first. I'm not sure why autoload is broken.

(setq viper-mode t
      viper-custom-file-name "~/.emacs.d/viper.el")
(require 'viper "viper.elc")

;; the rest are just in alphabetical order, ideally

(blink-cursor-mode -1)

(eval-after-load "coffee"
  (progn
    (defun coffee-custom ()
      (set (make-local-variable 'tab-width) 2))
    (add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))))

(column-number-mode 1)

(setq dired-listing-switches "-alhoF")
(add-hook 'dired-mode-hook 'toggle-truncate-lines)

(eval-after-load "espresso"
  (progn
    (defun espresso-custom ()
      (when (and buffer-file-name (string-match ".json" buffer-file-name))
	(set (make-local-variable 'espresso-indent-level) 2)))
    (add-hook 'espresso-mode-hook '(lambda () (espresso-custom)))))

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
  (savehist-mode 1)
  (setq savehist-file "~/.emacs.d/var/history"))

(when (require-soft 'saveplace)
  (setq save-place-file "~/.emacs.d/var/places.el")
  (setq-default save-place t))

(show-paren-mode 1)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(transient-mark-mode 1)

;; stick this crap down at the end

(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . espresso-mode))
(add-to-list 'auto-mode-alist '("shrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
