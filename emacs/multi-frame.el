;; This lets us start on a tty, X11 frame, or (preferably) as a daemon
;; that will create either on demand (possibly at the same time), with
;; the right color theme for each (light for X11, dark for tty). The
;; hook doesn't seem to get called if we are starting and creating a
;; frame at the same time, so for that case we kludge it in.
;;
;; tool-bar-mode should be in modes.el, not here, but it misbehaves
;; and turns itself on again every time we make a new frame.
;; menu-bar-mode and global-hl-line-mode really shouldn't be here at
;; all, as they are, well, global. But I don't *really* ever run tty
;; and X11 at the same time so I'll ignore the problem for now.

(defun frame-appropriate-display-settings ()
  (when-bound (tool-bar-mode -1))
  (let ((color-theme-is-global nil))
    (if window-system
        (progn
          (color-theme-decklin-light)
          (global-hl-line-mode 1)
          (menu-bar-mode 1))
      (progn
        (color-theme-decklin-dark)
        (global-hl-line-mode -1)
        (menu-bar-mode -1)))))

(frame-appropriate-display-settings)

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (frame-appropriate-display-settings)))
