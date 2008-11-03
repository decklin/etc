;; This allows us to start on a tty, X11 frame, or (preferably) as a
;; daemon that will create either on demand (possibly at the same
;; time). X11 gets my custom light theme, and tty gets the simplest
;; dark theme I could find that won't break hl-line et al. We have to
;; call this once now, and then in the hook when additional frames are
;; created later (Bleah. Ought to only be in the hook).
;;
;; tool-bar-mode should be in modes.el, not here, but it misbehaves
;; and turns itself on again every time we make a new frame.

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
