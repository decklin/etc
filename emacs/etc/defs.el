;; This is for "patterns" cribbed from EmacsWiki, so that we're all on
;; the same page, so to speak.

(defmacro require-soft (feature &optional file)
  "*Try to require FEATURE, but don't signal an error if `require' fails."
  `(require ,feature ,file t))

;; But it also includes some similar ones of my own.

(defmacro when-bound (form)
  `(when (fboundp ',(car form))
     ,form))
