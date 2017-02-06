;; Enable some default-disabled commands

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'qrr 'query-replace-regexp)

;; Simpler alternative to comment-dwim

(defun comment-toggle-line (beg end &optional arg)
  (interactive "*r\nP")
  (if mark-active
      (comment-or-uncomment-region beg end arg)
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

;; from wiki

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))
