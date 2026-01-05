;;; Package -- summary

;;Support for Lean mode

(message "Lean.init")
;; Packages required by lean-mode
(add-to-list 'package-selected-packages 'dash)
(add-to-list 'package-selected-packages 'lsp-mode)
(add-to-list 'package-selected-packages 'magit-section)
(package-install-selected-packages 'no-confirm)

(add-to-list 'load-path "~/.emacs.d/modes/lean4-mode")
;; Only if you **always** want to open lean-4
;;(require 'lean4-mode)

;; load lean4-mode only when a `.lean` file is opened
(autoload 'lean4-mode "lean4-mode" "Major mode for Lean 4." t)
(add-to-list 'auto-mode-alist '("\\.lean\\'" . lean4-mode))

(provide 'init-lean)
;;; init-lean.el ends here
