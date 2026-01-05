;;; package --- Spell checking
;;; Commentary:
;;;
;;; Code:
(message "Initialising spell-checking tools.")


;; (setq ispell-program-name "aspell"
;;       ispell-dictionary "canadian") ; or, if you insist, "american"



;; Configuration for Flyspell
(require 'flyspell)  ;; Load the `flyspell` package, which provides
                     ;; on-the-fly spell checking.

(flyspell-mode +1)  ;; Enable Flyspell mode globally. This checks for
                    ;; spelling errors in text buffers.

;; Use aspell for spell checking instead of ispell. Sets the command
;; option for the spell checker. This is used to configure `flyspell`
;; to run with `aspell`.
(setq ispell-list-command "--list")


(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Set a global keybinding for checking the previous highlighted word.
;; Binds the key combination Ctrl+c followed by 'f' to check the
;; previous highlighted word for spelling issues.
(global-set-key [(control c) (f)] 'flyspell-check-previous-highlighted-word)

;;-------------
;; Text mode
;;-------------
;; Enables Flyspell mode in text-based buffers like markdown or plain text.
(add-hook 'text-mode-hook 'flyspell-mode)
;; Enables Flyspell in programming mode by adding `flyspell-prog-mode`
;; to `prog-mode-hook`. This mode checks spelling only in comments and strings.
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(provide 'init-spellcheck)
