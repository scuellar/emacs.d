;; make sure company-coq starts with coq. Some other preferences are
;; set in custom-set-variables in init.el
;;; Code:
(add-hook 'coq-mode-hook #'company-coq-mode)

(provide 'init-coq)
;;; init-coq.el ends here
