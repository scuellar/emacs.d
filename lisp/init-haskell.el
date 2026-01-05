;;; package --- usefull settings to comfortably use Haskell
;;; Commentary:
;; make sure company starts with haskell. Some other preferences are
;; set in custom-set-variables in init.el
;;; Code:
(message "Initialising haskell env from : ~/.emacs.d/Lisp/init-haskell.el")


;; Ensure haskell-mode is installed
(use-package haskell-mode :ensure t)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'haskell-indent)

; HASKELL-MODE
; ------------

; Choose indentation mode
;; Use haskell-mode indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;; This is ok, as long as these variables are not set anywehre else
(custom-set-variables
 ; Set up hasktags (part 2)
 ;'(haskell-tags-on-save t)
 ; Set up interactive mode (part 2)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 ;; Start ghci using stack for updates
 '(haskell-process-type 'stack-ghci)
 )



;; Make sure errors are passed back to editor.
(setq haskell-process-args-stack-ghci
      '("--ghci-options=-ferror-spans"))

; Add key combinations for interactive haskell-mode
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "M-p") 'haskell-goto-prev-error)
  (define-key haskell-mode-map (kbd "M-n") 'haskell-goto-next-error)
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)))

; GHC-MOD
; -------

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))


;; Eglot, Corfu, and HLS Configuration
;; -----------------------------------

;; Install and configure Eglot
(use-package eglot
  :ensure t
  :hook (haskell-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(haskell-mode . ("haskell-language-server-wrapper" "--lsp"))))

;; Install and configure Corfu
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

;; Install and configure Haskell Language Server
(use-package haskell-mode
  :ensure t
  :hook (haskell-mode . eglot-ensure))

(provide 'init-haskell)
;;; init-haskell.el ends here
