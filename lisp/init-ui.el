;; This file doeas a bunch of stuff
;; It turns off menu bar, scroll bar, and tool bar,
;; as well as standard welcome message. It installs and
;; loads Atom One dark syntax theme.

;; Another important feature is Golden Ratio.
;; It resizes Emacs windows automatically to make the
;; window that has the focus to have perfect size for editing.

(require 'init-elpa)

;; port of the Atom One Dark theme from
;; Atom.io. https://github.com/jonathanchu/atom-one-dark-theme
(require-package 'atom-one-dark-theme)

;;  resizing automatically the windows you are working on to the size
;;  specified in the "Golden Ratio".
(require-package 'golden-ratio)
(require 'golden-ratio)
(golden-ratio-mode 1)

;; Fancy UI packlage that looks like VScode
;; https://emacs-lsp.github.io/lsp-ui/#lsp-ui
(use-package lsp-ui)

(setq inhibit-startup-message t)

;; Disbale menu popups
;;(menu-bar-mode -1)

;; Remove GUI tool bar at top
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Remove GUI tool bar at topscroll bars
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Default font
(set-face-attribute 'default nil :height 140)
;; Defualt line spacing
(setq-default line-spacing 0.4)

(setq
      x-select-enable-clipboard t
      x-select-enable-primary nil ;;dont copy selection
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

(load-theme 'atom-one-dark t)

;; disable cursor blinking altogether
(blink-cursor-mode 0)

;; Cursor shap and color
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")

;; No bell when end file and other
(setq ring-bell-function 'ignore)

(provide 'init-ui)
