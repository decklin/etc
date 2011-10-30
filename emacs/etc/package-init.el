(when (require-soft 'package)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
  (package-initialize))
