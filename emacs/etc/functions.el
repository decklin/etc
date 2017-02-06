(defun blank-line-p ()
  (= (current-indentation)
     (- (line-end-position) (line-beginning-position))))

(defun custom-var-standard-value (sym)
  (eval (car (get sym 'standard-value))))

(defun emacs-instance-type ()
  (if (boundp 'server-name)
      (if (string= server-name (custom-var-standard-value 'server-name))
          "server"
        (format "server (\"%s\")" server-name))
    "standalone"))

(defun add-server-state-to-scratch ()
  (with-current-buffer "*scratch*"
    (goto-char (point-min))
    (forward-line)
    (insert ";; Started as a " (emacs-instance-type) " instance\n")
    (forward-line)
    (set-buffer-modified-p nil)))
