;; Give emacs the same path as if it was on the shell
;; so they both have the same behavior on loads. 

(require 'init-elpa)

(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
