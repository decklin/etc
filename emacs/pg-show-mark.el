;; Original author: Patrick Gundlach
;; nice mark - shows mark as a highlighted 'cursor' so user 'always'
;; sees where the mark is. Especially nice for killing a region.

(defvar pg-mark-overlay nil "Overlay to show the position where the mark is")
(make-variable-buffer-local 'pg-mark-overlay)

(put 'pg-mark-mark 'face 'secondary-selection)

(defun pg-show-mark ()
  "Display an overlay where the mark is at. Should be hooked into activate-mark-hook"
  (unless pg-mark-overlay
    (setq pg-mark-overlay (make-overlay 0 0 (current-buffer) nil nil))
    (overlay-put pg-mark-overlay 'category 'pg-mark-mark))
  (let ((here (mark t)))
    (when here
      (move-overlay pg-mark-overlay here (1+ here)))))

(add-hook 'activate-mark-hook 'pg-show-mark)

(defadvice exchange-point-and-mark (after pg-mark-exchange-point-and-mark act)
  "Show visual marker"
  (pg-show-mark))

(defadvice yank (after pg-mark-yank act)
  "Redisplay visual marker"
  (pg-show-mark))

;; (ad-add-advice 'yank
;;                '(test-of-advice t t xxx) ; t t (advice . (lambda () (pg-show-mark))))
;;                'after 'last)

;; (dolist (cmd '(exchange-point-and-mark yank))
;;   (ad-add-advice cmd
;;                  '(still-not-working t t (advice . (lambda (x) (pg-show-mark))))
;;                  'after 'last))
