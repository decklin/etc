;; Decklin's Emacs config

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/libs")

;; Need defs first since other files will use require-soft, etc.

(load "defs.el")
(load "modes.el")
(load "commands.el")
(load "bindings.el")

;; Define color themes, then have multi-frame install them.

(load "decklin-color-themes.el")
(load "multi-frame.el")

;; Only required when I have an X display and fonts to customize.

(load "site-frame-init.el" t)

;; The rest of this is pretty pedestrian.

(setq abbrev-file-name "~/.emacs.d/abbrev_defs"
      backup-by-copying-when-linked t
      c-basic-offset 4
      inhibit-startup-screen t
      initial-scratch-message nil
      isearch-allow-scroll t
      make-backup-files nil
      mouse-yank-at-point t
      mouse-wheel-progressive-speed nil
      safe-local-variable-values '(encoding . utf-8)
      sentence-end-double-space nil
      speedbar-show-unknown-files t
      speedbar-use-images nil
      use-dialog-box nil
      vc-follow-symlinks t
      server-raise-frame nil)

(setq-default fill-column 72
              indent-tabs-mode nil
              show-trailing-whitespace t)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'qrr 'query-replace-regexp)
