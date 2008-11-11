;; always come up in emacs mode, ready to switch to vi when needed.

(nconc viper-emacs-state-mode-list viper-vi-state-mode-list)
(setq viper-vi-state-mode-list nil)

;; ha ha "expert". anyway. the ESC timeout here is because i *never*
;; want quick multiple keypresses to be considered a fake function
;; key. i generally hit ESC and immediately try to move with j or k,
;; and this always bit me on the ass in vile over slow network links.

(setq viper-ESC-keyseq-timeout 0
      viper-expert-level 5
      viper-case-fold-search t
      viper-inhibit-startup-message t
      viper-shift-width 4
      viper-vi-style-in-minibuffer nil
      viper-want-ctl-h-help t)

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
(define-key viper-insert-global-user-map (kbd "C-\\") 'universal-argument)
(define-key viper-vi-global-user-map (kbd "C-\\") 'universal-argument)
(define-key viper-vi-global-user-map (kbd "C-q") 'fill-paragraph)
