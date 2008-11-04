(when (require-soft 'color-theme)
  (defun color-theme-decklin ()
    "Color theme by Decklin Foster, created 2008-11-02."
    (interactive)
    (color-theme-install
     '(color-theme-decklin
       ((background-mode . light)
        (background-color . "#ffffffffffff")
        (foreground-color . "#000000000000")
        (border-color . "#e949e949e949")
        (cursor-color . "#0ccd0ccd0ccd")
        (hl-line-face . hl-line)
        (list-matching-lines-buffer-name-face . underline)
        (list-matching-lines-face . match)
        (mouse-color . "#000000000000")
        (view-highlight-face . highlight)
        (viper-emacs-state-cursor-color . "#05e424c354f4")
        (viper-vi-state-cursor-color . "#a1df000045c9")
        (viper-insert-state-cursor-color . "#8a1b0000978d")
        (viper-replace-overlay-cursor-color . "#319a00006d70")
        (viper-saved-cursor-color-in-replace-mode . "#610861086108")
        (widget-mouse-face . highlight))
       (default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal))))
       (bold ((t (:bold t :weight bold))))
       (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
       (border ((t (nil))))
       (buffer-menu-buffer ((t (:bold t :weight bold))))
       (button ((t (:underline t))))
       (comint-highlight-input ((t (:bold t :weight bold))))
       (comint-highlight-prompt ((t (:foreground "#0000b2500276"))))
       (completions-common-part ((t (nil))))
       (completions-first-difference ((t (:bold t :weight bold))))
       (cursor ((t (:background "#53baffff0000"))))
       (diff-added ((t (:foreground "#00000000972d"))))
       (diff-file-header ((t (:weight bold))))
       (diff-header ((t (:background "grey95" :foreground "darkgreen"))))
       (diff-hunk-header ((t (:inherit diff-header :foreground "darkmagenta"))))
       (diff-removed ((t (:foreground "#885100000000"))))
       (escape-glyph ((t (:foreground "#9afe63663b06"))))
       (file-name-shadow ((t (:foreground "grey50"))))
       (fixed-pitch ((t (:family "Monospace"))))
       (font-lock-builtin-face ((t (:foreground "#4de63a1d98ae" :weight normal))))
       (font-lock-comment-delimiter-face ((t (:foreground "#23dd5d5566d1"))))
       (font-lock-comment-face ((t (:foreground "#2fc65a7f7a52"))))
       (font-lock-constant-face ((t (:foreground "#2d8f668f4f64"))))
       (font-lock-doc-face ((t (:foreground "#661054414e5b"))))
       (font-lock-function-name-face ((t (:foreground "#7eee26c87p9f0" :weight normal))))
       (font-lock-keyword-face ((t (:foreground "#4c1d6d8e24c1" :weight normal))))
       (font-lock-negation-char-face ((t (nil))))
       (font-lock-preprocessor-face ((t (:foreground "#7851322e60d1"))))
       (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
       (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
       (font-lock-string-face ((t (:foreground "#68f550394eb8"))))
       (font-lock-type-face ((t (:foreground "#1c7237831c72"))))
       (font-lock-variable-name-face ((t (:foreground "#40613eda2555" :weight normal))))
       (font-lock-warning-face ((t (:bold t :foreground "#bd7000001fe1" :weight bold))))
       (header-line ((t (:box (:line-width -1 :style released-button) :background "grey90" :foreground "grey20" :box nil))))
       (help-argument-name ((t (:italic t :slant italic))))
       (highlight ((t (:background "#ca5dee14ca5d"))))
       (hi-purple-b ((t (:foreground "#88f71d8c5a6b"))))
       (hi-cyan-b ((t (:foreground "#436b70cb62d9"))))
       (hi-blue-b ((t (:foreground "#436b622e70cb"))))
       (hl-line ((t (:background "#f34cfd70fa7b"))))
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
       (tooltip ((t (:family "Sans Serif" :background "#F7F1D5" :foreground "black"))))
       (trailing-whitespace ((t (:background "#ffff8000fbb8"))))
       (underline ((t (:underline t))))
       (variable-pitch ((t (:family "Sans Serif"))))
       (vertical-border ((t (nil))))
       (viper-minibuffer-emacs ((t (:background "#e4e4f2f2f5f5" :foreground "black"))))
       (viper-minibuffer-insert ((t (:background "#eaeae4e4f5f5" :foreground "black"))))
       (viper-minibuffer-vi ((t (:background "grey" :foreground "black"))))
       (viper-replace-overlay ((t (:background "#f5f5e4e4e601" :foreground "black"))))
       (viper-search ((t (:background "#eeeef5f5e4e4"))))
       (widget-button ((t (:bold t :weight bold))))
       (widget-button-pressed ((t (:foreground "red1"))))
       (widget-documentation ((t (:foreground "dark green"))))
       (widget-field ((t (:background "gray85"))))
       (widget-inactive ((t (:foreground "grey50"))))
       (widget-single-line-field ((t (:background "gray85"))))))))
