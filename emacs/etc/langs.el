(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))
(add-to-list 'auto-mode-alist '("shrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.step\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cheffile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.tweets\\'" . tweet-text-mode))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG\\'" . text-mode))
(add-to-list 'auto-mode-alist '("README\\'" . text-mode))
(add-to-list 'auto-mode-alist '("LICENSE\\'" . text-mode))

(setq ruby-deep-indent-paren nil)

(setq css-indent-offset 2)

(add-hook 'js-mode-hook
          (lambda ()
            (when (and buffer-file-name (string-match ".json" buffer-file-name))
              (set (make-local-variable 'js-indent-level) 2))))

(setq js2-auto-indent-flag nil
      js2-mode-escape-quotes nil
      js2-cleanup-whitespace nil
      js2-enter-indents-newline nil
      js2-mirror-mode nil
      js2-mode-escape-quotes nil
      js2-mode-squeeze-spaces nil
      js2-rebind-eol-bol-keys nil)

(setq coffee-tab-width 2)

(setq haskell-indent-offset 2)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(define-derived-mode tweet-text-mode text-mode "Tweet Text"
  (setq fill-column 140))

(add-hook 'c-mode-hook 'infer-indentation-style)
