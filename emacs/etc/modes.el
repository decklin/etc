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

(when (require-soft 'helm-config)
  (helm-mode 1)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring))

(blink-cursor-mode -1)

(column-number-mode 1)

(when-bound (fringe-mode 3))

(setq dired-listing-switches "-alhoF")
(add-hook 'dired-mode-hook 'toggle-truncate-lines)

(eval-after-load "info"
  '(define-key Info-mode-map (kbd "M-n") 'next-buffer))

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

(when (require-soft 'recentf)
  (recentf-mode t))

(when (require-soft 'savehist)
  (setq savehist-file "~/.emacs.d/var/history")
  (savehist-mode 1))

;; As of 25.1 using trying to run gnupg on the tty fails with the
;; dreaded "Inappropriate ioctl for device" when emacs is running as a
;; server and has detached from its initial tty. Use the minibuffer
;; instead, like (I think) pre-24 Emacs. Note: this requires gnupg 2.1.
(when (require-soft 'epa-file)
  (add-hook 'emacs-startup-hook
            (lambda ()
              (when server-name (setq epa-pinentry-mode 'loopback)))))

;; for Emacs >= 25
(when-bound (save-place-mode 1))
;; in case of older Emacs
(when (require-soft 'saveplace) (setq-default save-place t))
;; even if neither are available, settings won't hurt
(setq save-place-file "~/.emacs.d/var/places.el"
      save-place-forget-unreadable-files nil)

(show-paren-mode 1)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(define-derived-mode tweet-text-mode text-mode "Tweet Text"
  (setq fill-column 140))

(add-hook 'c-mode-hook 'infer-indentation-style)

(transient-mark-mode 0)

(setq viper-mode t
      viper-custom-file-name "~/.emacs.d/etc/viper.el")
(autoload 'viper-change-state-to-emacs "viper.elc")
(add-hook 'find-file-hook 'viper-change-state-to-emacs t)
(add-hook 'change-major-mode-hook 'viper-change-state-to-emacs t)
