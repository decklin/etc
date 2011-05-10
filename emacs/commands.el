;; really, all i wanted was to comment a line.

(defun comment-toggle-line (arg)
  (interactive "p")
  (if (and mark-active transient-mark-mode)
      (comment-or-uncomment-region (region-beginning) (region-end) arg)
    (save-excursion
      (beginning-of-line)
      (let ((beg (point)))
        (forward-line arg)
        (backward-char)
        (comment-or-uncomment-region beg (point))))))

;; oh my god, i hate everyone. read the motherfucking ICCCM.

(defun speedbar-positioned ()
  (interactive)
  (speedbar)
  (when speedbar-frame
    (sit-for 0.1)
    (speedbar-frame-reposition-smartly)))

;; mostly trivial things

(defun kill-this-buffer ()
  (interactive)
  (kill-buffer nil))

(defun kill-to-beginning-of-line ()
  (interactive)
  (kill-line 0))
