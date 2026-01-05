;;; Package -- summary

;;In order to get support for many of the LaTeX packages you will use in your documents,
;; you should enable document parsing as well, which can be achieved by putting:
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; ToFinally, if you often use, you should make AUCTeX aware of the multi-file
;; document structure ( \include or \input). 
(setq-default TeX-master nil)


(provide 'init-latex)
;;; init-latex.el ends here
