;;; package --- usefull settings to comfortably use OCaml
;;; Commentary:
;; make sure company starts with OCaml. Some other preferences are
;; set in custom-set-variables in init.el
;;; Code:
(message "Initialising ocaml env from : ~/.emacs.d/Lisp/init-ocaml.el")


;; Major mode for OCaml programming
(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode)))

;; Major mode for editing Dune project files
(use-package dune
  :ensure t)

;; Merlin provides advanced IDE features
(use-package merlin
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (add-hook 'merlin-mode-hook #'company-mode)
  ;; we're using flycheck instead
  (setq merlin-error-after-save nil))

(use-package merlin-eldoc
  :ensure t
  :hook ((tuareg-mode) . merlin-eldoc-setup))

;; This uses Merlin internally
(use-package flycheck-ocaml
  :ensure t
  :config
  (flycheck-ocaml-setup))

(provide 'init-ocaml)
;;; init-ocaml.el ends here
