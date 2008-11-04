;; this is a rather naive hack... my lisp is rusty. why does viper not
;; provide functions for this?

(defun schlep-modes (dest src modes)
  (mapc (lambda (mode)
          (setq src (delete mode src))
          (add-to-list dest mode))
        modes))
(defun viper-ish-modes (modes)
  (schlep-modes 'viper-vi-state-mode-list
                viper-emacs-state-mode-list modes))
(defun emacs-ish-modes (modes)
  (schlep-modes 'viper-emacs-state-mode-list
                viper-vi-state-mode-list modes))

;; and i only want it to change these few.

(viper-ish-modes '(recentf-dialog-mode ruby-mode))
(emacs-ish-modes '(lisp-interaction-mode))

;; ha ha "expert"

(setq viper-inhibit-startup-message t
      viper-expert-level 5
      viper-want-ctl-h-help t
      viper-vi-style-in-minibuffer nil
      viper-case-fold-search t)

;; these don't get called when exiting the minibuffer, so they are
;; sort of useless. but ideally, the fringe is a nice place to put a
;; subtle visual reminder of state.
;;
;; these colors should be moved to my theme somehow, especially the
;; inherited gray default.

(add-hook 'viper-emacs-state-hook
          (lambda () (set-face-background 'fringe "gray95")))

(add-hook 'viper-vi-state-hook
          (lambda () (set-face-background 'fringe "#f0a3e703ec54")))

(add-hook 'viper-insert-state-hook
          (lambda () (set-face-background 'fringe "#ebe6f332f0f4")))

;; and if that wasn't enough, make the id tag over on the right side
;; of the mode-line big and colored. This one, like the cursor color,
;; actually is reliable.

(eval-after-load 'viper
  '(progn
     (setq
      viper-emacs-state-id "<Emacs> "
      viper-vi-state-id (propertize "<Vi> " 'face 'hi-purple-b)
      viper-insert-state-id (propertize "<Insert> " 'face 'hi-cyan-b)
      viper-replace-state-id (propertize "<Replace> " 'face 'hi-blue-b))
     (put 'viper-mode-string 'risky-local-variable t)))

;; i only scroll with ^D/^U in command mode (in real vi, they're
;; outdent and erase while in insert mode anyway). i mistakenly hit
;; C-d in insert mode expecting emacs behavior about 700 times before
;; i got to writing this part.
;;
;; C-q is just what my fingers are used to from an old vi setup where
;; i couldn't map M-q, and quoted-insert is useless outside of insert
;; mode anyway.

(define-key viper-insert-global-user-map (kbd "C-d") 'delete-char)
(define-key viper-insert-global-user-map (kbd "C-u") 'universal-argument)
(define-key viper-vi-global-user-map (kbd "C-q") 'fill-paragraph)
