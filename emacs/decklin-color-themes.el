(when (require-soft 'color-theme)
  (defun color-theme-decklin-light ()
    "Color theme by Decklin Foster, created 2008-11-02."
    (interactive)
    (color-theme-install
     '(color-theme-decklin-light
       ((background-mode . light)
        (background-color . "#eae0eae0eae0")
        (foreground-color . "#2b852b852b85")
        (border-color . "#e949e949e949")
        (cursor-color . "#199a199a199a")
        (hl-line-face . hl-line)
        (list-matching-lines-buffer-name-face . underline)
        (list-matching-lines-face . match)
        (mouse-color . "#000000000000")
        (view-highlight-face . highlight)
        (viper-emacs-state-cursor-color . "#05e4242c54f4")
        (viper-vi-state-cursor-color . "#21fca1df0000")
        (viper-insert-state-cursor-color . "#978d000050d7")
        (viper-replace-overlay-cursor-color . "#36b800006d70")
        (viper-saved-cursor-color-in-replace-mode . "#610861086108")
        (widget-mouse-face . highlight))
       (default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal))))
       (bold ((t (:bold t :weight bold))))
       (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
       (border ((t (nil))))
       (buffer-menu-buffer ((t (:bold t :weight bold))))
       (button ((t (:underline t))))
       (comint-highlight-input ((t (:bold t :weight bold))))
       (comint-highlight-prompt ((t (:foreground "#0000b2508ea9"))))
       (completions-common-part ((t (nil))))
       (completions-first-difference ((t (:bold t :weight bold))))
       (cursor ((t (:background "#fb3fffff0000"))))
       (diff-added ((t (:foreground "#00000000972d"))))
       (diff-file-header ((t (:weight bold))))
       (diff-header ((t (:background "grey95" :foreground "darkgreen"))))
       (diff-hunk-header ((t (:inherit diff-header :foreground "darkmagenta"))))
       (diff-removed ((t (:foreground "#885100000000"))))
       (dired-directory ((t (:foreground "#1fd63ca19b48"))))
       (dired-flagged ((t (:foreground "#33fead7a636d"))))
       (dired-header ((t (:foreground "#59567bf78787"))))
       (dired-ignored ((t (:foreground "#a8f5a8f5a8f5"))))
       (dired-mark ((t nil)))
       (dired-marked ((t (:foreground "#a147167030f4"))))
       (dired-perm-write ((t (:foreground "#6f2d34162b38"))))
       (dired-symlink ((t (:foreground "#35f36fba4e08"))))
       (dired-warning ((t (:foreground "#aee827cc65c7"))))
       (escape-glyph ((t (:foreground "#9afe63663b06"))))
       (file-name-shadow ((t (:foreground "grey50"))))
       (fixed-pitch ((t (:family "Monospace"))))
       (font-lock-builtin-face ((t (:foreground "#32724ab6a656" :weight normal))))
       (font-lock-comment-delimiter-face ((t (:foreground "#23dd5d5566d1"))))
       (font-lock-comment-face ((t (:foreground "#3d1d56196285"))))
       (font-lock-constant-face ((t (:foreground "#2af17ddc477e"))))
       (font-lock-doc-face ((t (:foreground "#6cc24da24352"))))
       (font-lock-function-name-face ((t (:foreground "#4dcd278a87e0" :weight normal))))
       (font-lock-keyword-face ((t (:foreground "#6d8e24c13ad9" :weight normal))))
       (font-lock-negation-char-face ((t (nil))))
       (font-lock-preprocessor-face ((t (:foreground "#70177851322e"))))
       (font-lock-regexp-grouping-backslash ((t (:weight normal))))
       (font-lock-regexp-grouping-construct ((t (:weight normal))))
       (font-lock-string-face ((t (:foreground "#68f55d695ecd"))))
       (font-lock-type-face ((t (:foreground "#1ed04b471ed0"))))
       (font-lock-variable-name-face ((t (:foreground "#50273bd32222" :weight normal))))
       (font-lock-warning-face ((t (:foreground "#bd7000006b16" :bold t :weight bold))))
       (fringe ((t (:background "gray95" :foreground "#000000000000"))))
       (header-line ((t (:box (:line-width -1 :style released-button) :background "grey90" :foreground "grey20" :box nil))))
       (help-argument-name ((t (:italic t :slant italic))))
       (highlight ((t (:background "#c858dc28c858"))))
       (hi-purple-b ((t (:foreground "#88f71d8c5a6b"))))
       (hi-cyan-b ((t (:foreground "#436b70cb62d9"))))
       (hi-blue-b ((t (:foreground "#436b622e70cb"))))
       (hl-line ((t (:background "#f48efe14fb4d" :bold t :weight bold))))
       (ido-first-match ((t (:bold t :weight bold))))
       (ido-incomplete-regexp ((t (:bold t :weight bold :foreground "Red1"))))
       (ido-indicator ((t (:background "red1" :foreground "yellow1" :width condensed))))
       (ido-only-match ((t (:foreground "ForestGreen"))))
       (ido-subdir ((t (:foreground "red1"))))
       (isearch ((t (:background "#ced890a0eab6" :foreground "lightskyblue1"))))
       (isearch-fail ((t (:background "#e170b7a7cdd5"))))
       (italic ((t (:italic t :slant italic))))
       (lazy-highlight ((t (:background "paleturquoise"))))
       (link ((t (:foreground "blue1" :underline t))))
       (link-visited ((t (:underline t :foreground "magenta4"))))
       (match ((t (:background "yellow1"))))
       (menu ((t (nil))))
       (minibuffer-prompt ((t (:foreground "medium blue"))))
       (mode-line ((t (:background "#d999d999d999" :foreground "black" :box (:line-width -1 :color "#a147a147a147" :style nil)))))
       (mode-line-buffer-id ((t (:bold t :weight bold))))
       (mode-line-emphasis ((t (:bold t :weight bold))))
       (mode-line-highlight ((t (:box (:line-width 2 :color "grey40" :style released-button)))))
       (mode-line-inactive ((t (:background "grey90" :foreground "grey40" :box (:line-width -1 :color "grey75" :style nil) :weight light))))
       (mouse ((t (nil))))
       (next-error ((t (:background "lightgoldenrod2"))))
       (nobreak-space ((t (:foreground "brown" :underline t))))
       (query-replace ((t (:foreground "lightskyblue1" :background "magenta3"))))
       (region ((t (:background "#fd70f618f042"))))
       (scroll-bar ((t (nil))))
       (secondary-selection ((t (:background "#f7f7d7d7d5d5"))))
       (shadow ((t (:foreground "#77037d0180d4"))))
       (show-paren-match ((t (:background "#c5c5d8d8ffff"))))
       (show-paren-mismatch ((t (:background "#bff06530ffff"))))
       (tool-bar ((t (:background "grey75" :box (:line-width 1 :style released-button)))))
       (tooltip ((t (:family "Sans Serif" :background "#f7f7f1f1d5d5" :foreground "black"))))
       (trailing-whitespace ((t (:background "#ffffc000fbb8"))))
       (underline ((t (:underline t))))
       (variable-pitch ((t (:family "Sans Serif"))))
       (vertical-border ((t (nil))))
       (viper-minibuffer-emacs ((t (:background "#e4e4f2f2f5f5" :foreground "black"))))
       (viper-minibuffer-insert ((t (:background "#eaeae4e4f5f5" :foreground "black"))))
       (viper-minibuffer-vi ((t (:background "grey" :foreground "black"))))
       (viper-replace-overlay ((t (:background "#f5f5e4e4e601" :foreground "black"))))
       (viper-search ((t (:background "#eeeef5f5e4e4"))))
       (widget-documentation ((t (:foreground "dark green"))))
       (widget-field ((t (:background "gray85"))))
       (widget-inactive ((t (:foreground "grey50"))))
       (widget-single-line-field ((t (:background "gray85")))))))
  (defun color-theme-decklin-tty ()
    "Color theme by Decklin Foster, created 2008-11-02."
    (interactive)
    (color-theme-install
     '(color-theme-decklin-tty
       ((background-mode . dark)
        (foreground-color . "default")
        (background-color . "default")
        (cursor-color . "default")
        (hl-line-face . hl-line)
        (list-matching-lines-buffer-name-face . underline)
        (list-matching-lines-face . match)
        (view-highlight-face . highlight)
        (widget-mouse-face . highlight))
       (default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal))))
       (bold ((t (:bold t :weight bold))))
       (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
       (border ((t (nil))))
       (buffer-menu-buffer ((t (:bold t :weight bold))))
       (button ((t (:underline t))))
       (comint-highlight-input ((t (:bold t :weight bold))))
       (comint-highlight-prompt ((t (:foreground "#ffff5dbffd9a"))))
       (completions-common-part ((t (nil))))
       (completions-first-difference ((t (:bold t :weight bold))))
       (cursor ((t (:background "#bc561111ffff"))))
       (diff-added ((t (:foreground "#11a" :bold t))))
       (diff-file-header ((t (:weight bold))))
       (diff-header ((t (:background "#222" :foreground "darkgreen"))))
       (diff-hunk-header ((t (:inherit diff-header :foreground "darkmagenta"))))
       (diff-removed ((t (:foreground "#a11" :bold t))))
       (dired-directory ((t (:foreground "#a147aaf0ffff" :bold t))))
       (dired-flagged ((t (:foreground "#f47a8d31cd69" :bold t))))
       (dired-header ((t (:foreground "#c35be666b929" :bold t))))
       (dired-ignored ((t (:foreground "#ab868fe87e93" :bold t))))
       (dired-mark ((t nil)))
       (dired-marked ((t (:foreground "#916bee4daa3b" :bold t))))
       (dired-perm-write ((t (:foreground "#a1d3d139d5c8" :bold t))))
       (dired-symlink ((t (:foreground "#c618e7f0edb6" :bold t))))
       (dired-warning ((t (:foreground "#ffffb3c9acdc" :bold t))))
       (escape-glyph ((t (:foreground "#7612acaac5fa" :bold t))))
       (file-name-shadow ((t (:foreground "grey50"))))
       (fixed-pitch ((t (:family "Monospace"))))
       (flyspell-incorrect ((t (:foreground "#aaefbaaea2b5" :bold t))))
       (flyspell-duplicate ((t (:foreground "#d381aa81a1aa" :bold t))))
       (font-lock-builtin-face ((t (:foreground "#193e4dc56809" :bold t))))
       (font-lock-comment-delimiter-face ((t (:foreground "#711a04aba0ba" :bold t))))
       (font-lock-comment-face ((t (:foreground "#4de28468b948" :bold t))))
       (font-lock-constant-face ((t (:foreground "#d381aa81a1aa" :bold t))))
       (font-lock-doc-face ((t (:foreground "#aaefbaaea2b5" :bold t))))
       (font-lock-function-name-face ((t (:foreground "#00008888ffff" :bold t))))
       (font-lock-keyword-face ((t (:foreground "#1e3e1c4e6932" :bold t))))
       (font-lock-negation-char-face ((t (nil))))
       (font-lock-preprocessor-face ((t (:foreground "#98becdd2af3e" :bold t))))
       (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
       (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
       (font-lock-string-face ((t (:foreground "#14f542310000" :bold t))))
       (font-lock-type-face ((t (:foreground "#deb7bd29deb7" :bold t))))
       (font-lock-variable-name-face ((t (:foreground "#3d705b8fffff" :bold t))))
       (font-lock-warning-face ((t (:foreground "#ffff539f7f73" :bold t :weight bold))))
       (fringe ((t (:background "gray95" :foreground "#4ad7ffffaeaf"))))
       (header-line ((t (:box (:line-width -1 :style released-button) :background "grey90" :foreground "grey20" :box nil))))
       (help-argument-name ((t (:italic t :slant italic))))
       (highlight ((t (:foreground "red" :background "default" :inverse-video t))))
       (hi-purple-b ((t (:foreground "#8819e384b6a5"))))
       (hi-cyan-b ((t (:foreground "#aca59f45ad37"))))
       (hi-blue-b ((t (:foreground "#aca5add29f45"))))
       (hl-line ((t (:background "black"))))
       (ido-first-match ((t (:bold t :weight bold))))
       (ido-incomplete-regexp ((t (:bold t :weight bold :foreground "Red1"))))
       (ido-indicator ((t (:background "red1" :foreground "yellow1" :width condensed))))
       (ido-only-match ((t (:foreground "ForestGreen"))))
       (ido-subdir ((t (:foreground "red1"))))
       (isearch ((t (:foreground "#42387f6f265a" :background "default" :inverse-video t))))
       (isearch-fail ((t (:foreground "#2e9f0969433b" :inverse-video t))))
       (italic ((t (:italic t :slant italic))))
       (lazy-highlight ((t (:background "paleturquoise"))))
       (link ((t (:foreground "blue1" :underline t))))
       (link-visited ((t (:underline t :foreground "magenta4"))))
       (match ((t (:background "red"))))
       (menu ((t (nil))))
       (minibuffer-prompt ((t (:foreground "medium blue"))))
       (mode-line ((t (:background "default" :foreground "default" :inverse-video t))))
       (mode-line-buffer-id ((t (:bold t :weight bold))))
       (mode-line-emphasis ((t (:bold t :weight bold))))
       (mode-line-inactive ((t (:background "white" :foreground "black" :bold t))))
       (mouse ((t (nil))))
       (next-error ((t (:background "lightgoldenrod2"))))
       (nobreak-space ((t (:foreground "brown" :underline t))))
       (query-replace ((t (:foreground "lightskyblue1" :background "magenta3"))))
       (region ((t (:background "#b735d5d4debd" :foreground "default"))))
       (scroll-bar ((t (nil))))
       (secondary-selection ((t (:foreground "green" :background "default" :inverse-video t))))
       (shadow ((t (:foreground "#99fc93fe8f3a"))))
       (show-paren-match ((t (:foreground "magenta" :background "default" :inverse-video t))))
       (show-paren-mismatch ((t (:foreground "red" :background "default" :inverse-video t))))
       (trailing-whitespace ((t (:background "black"))))
       (underline ((t (:underline t))))
       (variable-pitch ((t (:family "Sans Serif"))))
       (vertical-border ((t (nil))))
       (viper-minibuffer-emacs ((t (:foreground "white" :background "black"))))
       (viper-minibuffer-insert ((t (:foreground "white" :background "black"))))
       (viper-minibuffer-vi ((t (:foreground "white" :background "black"))))
       (viper-replace-overlay ((t (:foreground "white" :background "black"))))
       (viper-search ((t (:background "yellow"))))
       (widget-button ((t (:bold t :weight bold))))
       (widget-button-pressed ((t (:foreground "red1"))))
       (widget-button ((t (:bold t :weight bold))))
       (widget-button-pressed ((t (:foreground "red1"))))
       (widget-documentation ((t (:foreground "dark green"))))
       (widget-field ((t (:background "gray85"))))
       (widget-inactive ((t (:foreground "grey50"))))
       (widget-single-line-field ((t (:background "gray85"))))))))
