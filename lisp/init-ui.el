;; This file doeas a bunch of stuff
;; It turns off menu bar, scroll bar, and tool bar,
;; as well as standard welcome message. It installs and
;; loads Atom One dark syntax theme.

;; Another important feature is Golden Ratio.
;; It resizes Emacs windows automatically to make the
;; window that has the focus to have perfect size for editing.

(require 'init-elpa)
(require-package 'atom-one-dark-theme)
(require-package 'golden-ratio)

(require 'golden-ratio)

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.4)

(setq
      x-select-enable-clipboard t
      x-select-enable-primary nil ;;dont copy selection
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

(load-theme 'atom-one-dark t)

(blink-cursor-mode 0)
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")
(setq ring-bell-function 'ignore)

(golden-ratio-mode 1)

(provide 'init-ui)
