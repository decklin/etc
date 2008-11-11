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

(when-bound (fringe-mode '(0)))

(when (require-soft 'ido)
  (ido-mode t)
  (setq ido-max-window-height 1
        ido-case-fold nil
        ido-enable-prefix t
        ido-enable-flex-matching t))

(eval-after-load "info"
  '(define-key Info-mode-map (kbd "M-n") 'next-buffer))

(when (require-soft 'recentf)
  (recentf-mode t))

(when (require-soft 'ruby-electric)
  (add-hook 'ruby-mode-hook
            '(lambda () (ruby-electric-mode t))))

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
(add-to-list 'auto-mode-alist '("shrc\\'" . sh-mode))
