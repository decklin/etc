;; Decklin's Emacs config

(add-to-list 'load-path "~/.emacs.d/etc")
(add-to-list 'load-path "~/.emacs.d/lib")
(add-to-list 'load-path "~/.emacs.d/local")

;; Need defs first since other files will use require-soft, etc.

(load "defs.el")

(when (require-soft 'package)
  (load "package-repos.el")
  (package-initialize))

;; Most stuff is broken out into these files

(load "autoloads.el")
(load "modes.el")
(load "commands.el")
(load "bindings.el")
(load "multi-frame.el")

;; Random stuff from EmacsWiki, etc

(load "infer-indentation.el")
(load "pg-show-mark.el")
(load "ruby-flymake.el")

;; The rest of this is pretty pedestrian.

(setq abbrev-file-name "~/.emacs.d/var/abbrev-defs"
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-by-copying-when-linked t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      c-basic-offset 4
      compilation-read-command nil
      css-indent-offset 2
      echo-keystrokes (/ 1.0 6)
      inhibit-startup-screen t
      initial-scratch-message (format-time-string ";; This Emacs was started at %T on %F\n\n")
      isearch-allow-scroll t
      ispell-program-name "aspell"
      ispell-list-command "list"
      ispell-extra-args '("--sug-mode=fast")
      mac-command-modifier 'meta
      make-backup-files nil
      mouse-yank-at-point t
      mouse-wheel-progressive-speed nil
      require-final-newline 'visit-save
      ruby-deep-indent-paren nil
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

;; Tell customize not to step on this file, and load anything set with
;; customize

(setq custom-file "~/.emacs.d/local/custom.el")
(load custom-file)

;; I never, ever want fg/bg color overridden by a theme. If our theme
;; came from customize, rectify it here. If setting up a theme in
;; site-init.el below, we can use this variable there.

(defvar default-fg-bg
  '(default ((t (:foreground "default" :background "default")))))

(dolist (theme custom-enabled-themes)
  (custom-theme-set-faces theme default-fg-bg))

;; Load this at the end so we can override anything we need to

(load "site-init.el" t)
