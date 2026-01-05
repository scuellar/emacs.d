;;; package --- usefull settings to edit and search files
;;; Commentary:
;;; Many packages are loaded here
;;; Code:
(message "Initialising editing tools.")


(require 'init-elpa)
(require 'saveplace)
(require-package 'rainbow-delimiters)
(require-package 'flycheck)



;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight trailing whitespaces, and auto delete trailing whitespace
;; on save
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;; Always use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Highlight lines above 80
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)


;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
;; That is, default to using regex search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Indent every time you press `'enter`'
(define-key global-map (kbd "RET") 'newline-and-indent)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace

(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Highlight specific keywords in source code `highlight-phrase`
;; highlights specific patterns in the file.  The regex matches the
;; keywords "BUG", "FIXME", "TODO", or "NOTE", followed by a colon.
;; This is helpful to visually identify important annotations in
;; source code.
(add-hook 'find-file-hook  ;; `find-file-hook` is triggered whenever a file is opened.
          (lambda ()       ;; Defines a lambda function to execute when a file is opened.
            (highlight-phrase "\\(BUG\\|FIXME\\|TODO\\|NOTE\\):")))

(provide 'init-editing)
