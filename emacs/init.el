;; Decklin's Emacs config

;; make sure to start viper first; it's fragile. auto-load is broken
;; for some reason.

(setq viper-mode t
      viper-custom-file-name "~/.emacs.d/viper.el")
(load "viper.elc")
(require 'viper)

;; now load other features

(add-to-list 'load-path "~/.emacs.d")

(require 'color-theme)
(load "decklin-color-themes.el")

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

;; built-in modes. fringe doesn't work, the docs are sketchy on details.

(transient-mark-mode 1)
(blink-cursor-mode -1)
(show-paren-mode 1)
(column-number-mode 1)
(set-fringe-mode 2)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;; variables. keep this sorted!

(setq abbrev-file-name "~/.emacs.d/abbrev_defs"
      c-basic-offset 4
      fill-column 72
      inhibit-startup-screen t
      initial-scratch-message nil
      isearch-allow-scroll t
      make-backup-files nil
      mouse-yank-at-point t
      mouse-wheel-progressive-speed nil
      sentence-end-double-space nil
      speedbar-show-unknown-files t
      speedbar-use-images nil
      use-dialog-box nil)

(setq-default indent-tabs-mode nil
              show-trailing-whitespace t)

;; take off our helmet and seat belt

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; this configuration allows us to start on a tty "frame", x11 frame,
;; or (preferably) as a daemon that will create either kind of frame
;; on demand, possibly at the same time. x11 gets my custom light
;; theme, tty gets the simplest dark theme i could find that won't
;; break hl-line et al. we have to call this once now and then in the
;; hook on any additional frame creation later (bleah. ought to only
;; be in the hook).
;;
;; tool-bar-mode should be up there, not here, but it misbehaves and
;; turns itself on again every time we make a new frame.

(defun frame-appropriate-display-settings ()
  (tool-bar-mode -1)
  (let ((color-theme-is-global nil))
    (if window-system
        (progn
          (color-theme-decklin)
          (global-hl-line-mode 1)
          (menu-bar-mode 1))
      (progn
        (color-theme-dark-font-lock)
        (global-hl-line-mode -1)
        (menu-bar-mode -1)))))

(frame-appropriate-display-settings)

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (frame-appropriate-display-settings)))

;; also, i have different fonts and screen dimensions on each site

(load "local-frames.el")

;; finally, bindings.

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-x\C-r" 'recentf-open-files)
(global-set-key "\M-n" 'cyclebuffer-forward)
(global-set-key "\M-p" 'cyclebuffer-backward)
