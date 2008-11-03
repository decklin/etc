;; really, i just want to comment a line.

(defun comment-toggle-line (arg)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (let ((beg (point)))
      (forward-line arg)
      (backward-char)
      (comment-or-uncomment-region beg (point)))))

;; oh my god, i hate everyone. read the motherfucking ICCCM.

(defun speedbar-positioned ()
  (interactive)
  (speedbar)
  (when speedbar-frame
    (sit-for 0.1)
    (speedbar-frame-reposition-smartly)))
