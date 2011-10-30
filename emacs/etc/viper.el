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
      viper-vi-state-mode-list nil
      viper-want-ctl-h-help t)

(eval-after-load 'viper
  '(progn
     (remove-hook 'change-major-mode-hook 'viper-major-mode-change-sentinel)
     (remove-hook 'find-file-hook 'set-viper-state-in-major-mode)))

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

;; and if that wasn't enough, make the id tag over on the right side of
;; the mode-line garish. This one, like the fringe or cursor color, is
;; actually reliable.

(eval-after-load 'viper
  '(progn
     (setq viper-emacs-state-id "<E> "
           viper-vi-state-id (propertize "<V> " 'face 'hi-purple-b)
           viper-insert-state-id (propertize "<I> " 'face 'hi-cyan-b)
           viper-replace-state-id (propertize "<R> " 'face 'hi-blue-b))
     (put 'viper-mode-string 'risky-local-variable t)))

;; i only scroll with ^D/^U in command mode (in real vi, they're outdent
;; and erase while in insert mode anyway). i mistakenly hit C-d in
;; insert mode expecting emacs behavior about 700 times before i got to
;; writing this part.
;;
;; C-q is just what my fingers are used to from an old vi setup where i
;; couldn't map M-q, and quoted-insert is useless outside of insert mode
;; anyway.

(define-key viper-insert-global-user-map (kbd "C-d") 'delete-char)
(define-key viper-vi-global-user-map (kbd "C-v") 'scroll-down)
(define-key viper-vi-global-user-map (kbd "C-q") 'fill-paragraph)

;; Don't need zap-to-char if I can use this to quickly get at the much
;; nicer vi equivalents.

(global-set-key (kbd "M-z") 'viper-escape-to-vi)

;; I always use *scratch* if I need to eval something. This sets up a
;; nice sort of symmetry in Dvorak... :-)

(global-set-key (kbd "M-:") 'viper-ex)
