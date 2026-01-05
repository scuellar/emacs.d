;; Prefered choice of interpreter is iPython
;;; Code:
(when (executable-find "ipython3")
  (setq python-shell-interpreter "/opt/homebrew/bin/ipython3" ;;"ipython3"
	python-shell-interpreter-args "--simple-prompt -i"))

(use-package pyvenv :ensure t)
(use-package direnv :ensure t :config (direnv-mode))

(provide 'init-python)
;;; init-python.el ends here
