;; This is from EmacsWiki, use it everywhere

(defmacro require-soft (feature &optional file)
  "*Try to require FEATURE, but don't signal an error if `require' fails."
  `(require ,feature ,file t))

;; I made this up based on the above

(defmacro when-bound (form)
  `(when (fboundp ',(car form))
     ,form))

;; In case we're on Emacs < 24.4

(unless (fboundp 'with-eval-after-load)
  (defmacro with-eval-after-load (file &rest body)
    `(eval-after-load ,file (lambda () ,@body))))
