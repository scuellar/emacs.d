;;; LoadELPA -- Loads Elpa/Melpa
;;; Commentary:
;;; Installs melpa and binds "require package"
(require 'package)

;;; Code:
(defun require-package (package)
  "Install given PACKAGE if it was not installed before."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
	(package-refresh-contents))
      (package-install package))))

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))


;; Refresh once if necessary
(unless package-archive-contents
  (package-refresh-contents))

;; Ensure use-package itself is available
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)


(provide 'init-elpa)
;;; init-elpa ends here
