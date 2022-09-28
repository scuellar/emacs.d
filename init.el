;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Emacs Startup File --- initialization for Emacs
;; NOTE: We use '~/.emacs.d/init.el' (instead of, say, '~/.emacs' ) to keep all Emacs files in one folder (which is also a git repo).  YOU MUST REMOVE '~/.emacs' for this to work.  (See [find-init](https://www.gnu.org/software/emacs/manual/html_node/emacs/Find-Init.html#Find-Init) ).

;; the following command tells Emacs to
;; fetch scripts from .emacs.d/lisp
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" "~/.emacs.d"))

;; elpa/melpa
(require 'init-elpa)

;; Give emacs the same path as if it was on the shell
(require 'init-exec-path)

;; UI: Make emacs pretty
(require 'init-ui)

;; Editing, Search, backup, save-place
(require 'init-editing)

;; Navigation
(require 'init-navigation)

;; Text completion (Company mode)
(require 'init-company-mode)

;; Rust
(require 'init-rust)

;; Python
(require 'init-python)

;; Coq
(require 'init-coq)

;; Latex
(require 'init-latex)

;;Remember buffer history between sessions
(savehist-mode 1)

;;custom vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(markdown-preview-mode markdown-toc company-coq proof-general company-racer go-stacktracer flycheck-rust flycheck racer company cargo rust-mode exec-path-from-shell haskell-mode))
 '(ring-bell-function nil)
 '(visible-bell t))
(package-initialize)



;;Haskell (TODO move to haskell file)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'haskell-indent)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(when (memq window-system '(mac ns))
(exec-path-from-shell-initialize))

(eval-after-load "haskell"
  '(progn
     (define-key interactive-haskell-mode-map (kbd "M-n") 'haskell-goto-next-error)
     (define-key interactive-haskell-mode-map (kbd "M-p") 'haskell-goto-prev-error)
     (define-key interactive-haskell-mode-map (kbd "C-c M-p") 'haskell-goto-prev-error)))
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
