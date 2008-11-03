;; Make sure to start viper first. I'm not sure why autoload is broken.

(setq viper-mode t
      viper-custom-file-name "~/.emacs.d/viper.el")
(load "viper.elc")
(require 'viper)

(transient-mark-mode 1)
(blink-cursor-mode -1)
(show-paren-mode 1)
(column-number-mode 1)
(set-fringe-mode 2)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(require 'ido)
(ido-mode t)
(setq ido-max-window-height 1
      ido-case-fold nil
      ido-enable-prefix t
      ido-enable-flex-matching t)

(require 'recentf)
(recentf-mode t)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook
          '(lambda () (ruby-electric-mode t)))

(require 'saveplace)
(setq save-place-file "~/.emacs.d/places.el")
(setq-default save-place t)

(require 'yaml-mode)
