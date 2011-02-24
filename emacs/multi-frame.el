;; This lets us start on a tty, X11 frame, or (preferably) as a daemon
;; that will create either on demand (possibly at the same time), with
;; the right color theme for each (light for X11, dark for tty).
;;
;; tool-bar-mode should be in modes.el, not here, but it misbehaves
;; and turns itself on again every time we make a new frame.

(defun frame-appropriate-display-settings ()
  (when-bound (tool-bar-mode -1))
  (if window-system
      (progn
        (when-bound (color-theme-decklin-light))
        (menu-bar-mode 1))
    (progn
      (when-bound (color-theme-decklin-dark))
      (menu-bar-mode -1))))

;; If we're not a daemon, the color theme should be installed globally.
(when (not server-mode)
  (frame-appropriate-display-settings))

;; If frames only get created later, then color themes should be local.
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (let ((color-theme-is-global nil))
              (frame-appropriate-display-settings))))
