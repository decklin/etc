;; Make sure to start viper first. I'm not sure why autoload is broken.

(setq viper-mode t
      viper-custom-file-name "~/.emacs.d/viper.el")
(load "viper.elc")
(require 'viper)

(transient-mark-mode 1)
(blink-cursor-mode -1)
(show-paren-mode 1)
(column-number-mode 1)
(when-bound (set-fringe-mode 2))

(setq display-time-24hr-format t)
(display-time-mode 1)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(when (require-soft 'ido)
  (ido-mode t)
  (setq ido-max-window-height 1
        ido-case-fold nil
        ido-enable-prefix t
        ido-enable-flex-matching t))

(when (require-soft 'recentf)
  (recentf-mode t))

(when (require-soft 'ruby-electric)
  (add-hook 'ruby-mode-hook
            '(lambda () (ruby-electric-mode t))))

(when (require-soft 'saveplace)
  (setq save-place-file "~/.emacs.d/places.el")
  (setq-default save-place t))

(require-soft 'yaml-mode)
