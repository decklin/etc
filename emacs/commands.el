;; really, all i wanted was to comment a line.

(defun comment-toggle-line (arg)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (let ((beg (point)))
      (forward-line arg)
      (backward-char)
      (comment-or-uncomment-region beg (point)))))

;; from www.emacsblog.org/2007/04/09/highlight-the-current-line/

(defun local-hl-line-mode-off ()
  (interactive)
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil))

;; oh my god, i hate everyone. read the motherfucking ICCCM.

(defun speedbar-positioned ()
  (interactive)
  (speedbar)
  (when speedbar-frame
    (sit-for 0.1)
    (speedbar-frame-reposition-smartly)))
