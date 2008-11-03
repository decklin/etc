;; Decklin's Emacs config
;;
;; Warning: I have not set this up to work on Emacs 22 or older yet.
;; It will crash and burn unless everything in my setup exists.

(add-to-list 'load-path "~/.emacs.d")

;; Modes should come first, so that viper is always loaded.

(load "modes.el")
(load "commands.el")
(load "bindings.el")

(require 'color-theme)
(load "decklin-color-themes.el")
(load "multi-frame.el")

;; Only needed when I have an X display and fonts to customize.

(load "site-frame-init.el" t)

;; The rest of this is pretty pedestrian.

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

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'qrr 'query-replace-regexp)
