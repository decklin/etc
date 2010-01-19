;; Make sure to start viper first. I'm not sure why autoload is broken.

(setq viper-mode t
      viper-custom-file-name "~/.emacs.d/viper.el")
(load "viper.elc")
(require 'viper)

;; the rest are just in alphabetical order, ideally

(blink-cursor-mode -1)

(column-number-mode 1)

(setq dired-listing-switches "-alhoF")
(add-hook 'dired-mode-hook 'toggle-truncate-lines)

(setq display-time-24hr-format t)
(setq display-time-load-average-threshold 1.0)
(display-time-mode 1)

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

(load "json.el")
(load "espresso.el")

(when (require-soft 'recentf)
  (recentf-mode t))

(when (require-soft 'saveplace)
  (setq save-place-file "~/.emacs.d/places.el")
  (setq-default save-place t))

(add-hook 'speedbar-mode-hook 'local-hl-line-mode-off)

(show-paren-mode 1)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(transient-mark-mode 1)

(require-soft 'yaml-mode)

;; stick this crap down at the end

(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . espresso-mode))
(add-to-list 'auto-mode-alist '("shrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("m\\'" . matlab-mode))
