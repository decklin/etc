;; Decklin's Emacs config

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lib")

;; Need defs first since other files will use require-soft, etc.

(load "defs.el")
(load "packages.el")
(load "autoloads.el")
(load "modes.el")
(load "commands.el")
(load "bindings.el")

;; Define color themes, then have multi-frame install them.

(load "decklin-color-themes.el")
(load "multi-frame.el")

;; Only required when I have an X display and fonts to customize.

(load "site-frame-init.el" t)

;; Random stuff from EmacsWiki, etc

(load "pg-show-mark.el")

;; The rest of this is pretty pedestrian.

(setq abbrev-file-name "~/.emacs.d/var/abbrev-defs"
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-by-copying-when-linked t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      c-basic-offset 4
      compilation-read-command nil
      css-indent-offset 2
      inhibit-startup-screen t
      initial-scratch-message nil
      isearch-allow-scroll t
      mac-command-modifier 'meta
      make-backup-files nil
      mouse-yank-at-point t
      mouse-wheel-progressive-speed nil
      require-final-newline 'visit-save
      ;; FIXME this breaks help when displaying lists
      ;; safe-local-variable-values '(encoding . utf-8)
      sentence-end-double-space nil
      speedbar-show-unknown-files t
      speedbar-use-images nil
      use-dialog-box nil
      vc-follow-symlinks t
      x-stretch-cursor t
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
