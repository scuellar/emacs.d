(require 'init-elpa)
(require 'ido)
(require 'recentf)
(require-package 'smex)

(message "blah")

(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; Enable and configure IDO (Interactively Do Things) for improved
;; minibuffer completion.  IDO replaces standard Emacs completion
;; interfaces with smarter, interactive alternatives for things like
;; finding files, switching buffers, and selecting items.
(ido-mode t)
;; Enable fuzzy matching. For example, typing "rb" can match
;; "read-buffer".
(setq ido-enable-flex-matching t)
;; Don't pre-fill the minibuffer with a filename near the cursor. This
;; keeps prompts cleaner.
(setq ido-use-filename-at-point nil)
;; Disable automatic merging of work directories when
;; navigating. Prevents IDO from guessing paths across unrelated
;; directories.
(setq ido-auto-merge-work-directories-length -1)
;; Include recently opened (but now closed) files and non-file buffers
;; in IDO's buffer switcher.  This lets you quickly switch to files or
;; buffers that aren't currently open, making buffer navigation feel
;; more powerful and session-aware.
(setq ido-use-virtual-buffers t)

;; Extend IDO to work in all places Emacs uses `completing-read`,
;; including many prompts from other packages. This is the modern
;; replacement for `ido-ubiquitous-mode`.  If missing, needs to be
;; installed: M-x package-install RET ido-completing-read+ RET
(use-package ido-completing-read+
  :ensure t
  :config
  )

;; Ido for recent files.
(require 'recentf)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to find a recent file."
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(setq recentf-max-saved-items 50)

;; Ido virtual buffers.
(setq ido-use-virtual-buffers t)


;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


;; Enable Projectile for project-aware navigation and file management.
;; Useful keybindings: - C-c p f : Find file in project - C-c p p :
;; Switch project - C-c p s g : Search in project (grep/ripgrep)
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1))

;; Enable move point from window to window using Shift and the arrow
;; keys
(windmove-default-keybindings 'super)

(provide 'init-navigation)
