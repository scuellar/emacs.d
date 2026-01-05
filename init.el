;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Emacs Startup File --- initialization for Emacs
;; NOTE: We use '~/.emacs.d/init.el' (instead of, say, '~/.emacs' ) to
;; keep all Emacs files in one folder (which is also a git repo).  YOU
;; MUST REMOVE '~/.emacs' for this to work.  (See
;; [find-init](https://www.gnu.org/software/emacs/manual/html_node/emacs/Find-Init.html#Find-Init)
;; ).


(message "Starting initialization: init.el")

;; the following command tells Emacs to
;; fetch scripts from .emacs.d/lisp
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" "~/.emacs.d"))

(unless package-archive-contents
  (package-refresh-contents))

;; This sets $MANPATH, $PATH and exec-path from your shell, but only
;; when executed in a GUI frame on OS X and Linux.
(when (memq window-system '(mac ns))
(exec-path-from-shell-initialize))


;; elpa/melpa
(message "Init elpa")
(require 'init-elpa)

;; Give emacs the same path as if it was on the shell
(message "Init exec-path")
(require 'init-exec-path)

;; UI: Make emacs pretty
(message "Init UI")
(require 'init-ui)

;; Editing, Search, backup, save-place
(message "Init editing")
(require 'init-editing)

;; Spell checking
(message "Init spellcheck")
(require 'init-spellcheck)

;; Navigation
(message "Init navigation")
(require 'init-navigation)

;; Text completion (Company mode)
(message "Init copmany-mode")
(require 'init-company-mode)

;; Rust
(message "Init Languages...")
(require 'init-rust)

;; Python
(require 'init-python)

;; Haskell
(require 'init-haskell)

;; OCaml
(require 'init-ocaml)

;; Coq
(require 'init-coq)

;; Latex
(require 'init-latex)

;; lean
(require 'init-lean)

;;Remember buffer history between sessions
(savehist-mode 1)

;;custom vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(haskell-mode-hook nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'stack-ghci)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(company-ghci smart-mode-line-atom-one-dark-theme lsp-ui ## talonscript-mode markdown-preview-mode markdown-toc company-coq proof-general company-racer go-stacktracer flycheck-rust flycheck racer company cargo rust-mode exec-path-from-shell haskell-mode))
 '(ring-bell-function nil)
 '(visible-bell t)
 '(warning-suppress-types '((use-package))))
;;(package-initialize)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(provide '.emacs)
;;; init.el ends here
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
