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
(load "functions.el")
(load "commands.el")
(load "bindings.el")
(load "modes.el")
(load "langs.el")
(load "multi-frame.el")

;; Random stuff from EmacsWiki, etc

(load "infer-indentation.el")
(load "pg-show-mark.el")
(load "ruby-flymake.el")

;; Set variables

(setq ispell-program-name "aspell"
      ispell-list-command "list"
      ispell-extra-args '("--sug-mode=fast")
      mac-command-modifier 'meta
      mouse-wheel-progressive-speed nil
      x-stretch-cursor t)

;; Set variables that are customizable (TODO: should this be custom-set-default?)

(setq-default abbrev-file-name "~/.emacs.d/var/abbrev-defs"
              auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
              backup-by-copying-when-linked t
              backup-directory-alist `((".*" . ,temporary-file-directory))
              c-basic-offset 4
              compilation-read-command nil
              echo-keystrokes (/ 1.0 6)
              fill-column 72
              indent-tabs-mode nil
              inhibit-startup-screen t
              initial-scratch-message (format-time-string ";; Emacs init: %F %T\n\n")
              isearch-allow-scroll t
              make-backup-files nil
              mouse-yank-at-point t
              require-final-newline 'visit-save
              ;; FIXME this breaks help when displaying lists
              ;; safe-local-variable-values '(encoding . utf-8)
              sentence-end-double-space nil
              server-raise-frame nil
              show-trailing-whitespace t
              speedbar-show-unknown-files t
              speedbar-use-images nil
              use-dialog-box nil
              vc-follow-symlinks t)

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

;; Additional initial scratch message

(add-hook 'emacs-startup-hook 'add-server-state-to-scratch)

;; And stop me from killing it

(when-bound
 (advice-add #'kill-buffer :before-until
             (lambda (&optional buffer-or-name)
               (when (equal buffer-or-name "*scratch*")
                 (bury-buffer)
                 t))))

;; Load this at the end so we can override anything we need to

(load "site-init.el" t)
