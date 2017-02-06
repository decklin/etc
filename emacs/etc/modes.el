(transient-mark-mode 0)

(blink-cursor-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(when-bound (fringe-mode 3))

(when (require-soft 'helm-config)
  (helm-mode 1)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring))

(setq viper-mode t
      viper-custom-file-name "~/.emacs.d/etc/viper.el")
(autoload 'viper-change-state-to-emacs "viper.elc")
(add-hook 'find-file-hook 'viper-change-state-to-emacs t)
(add-hook 'change-major-mode-hook 'viper-change-state-to-emacs t)

(when (require-soft 'savehist)
  (setq savehist-file "~/.emacs.d/var/history")
  (savehist-mode 1))

(when (require-soft 'recentf)
  (recentf-mode t))

(setq dired-listing-switches "-alhoF")
(add-hook 'dired-mode-hook 'toggle-truncate-lines)

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
