;; beam files
(make-face 'font-lock-special-macro-face)
(make-face 'font-lock-special-args-face)
(set-face-foreground 'font-lock-special-macro-face "#beed5f")
(set-face-foreground 'font-lock-special-args-face "#8e5fed")

(defun add-custom-keyw()
  "adds a few special keywords for c and c++ modes"
  (font-lock-add-keywords nil
                          '(
                            ("@\\<\\(title\\)" . 'font-lock-special-macro-face )
                            ("@\\<\\(author\\)" . 'font-lock-special-macro-face )
                            ("@\\<\\(date\\)" . 'font-lock-special-macro-face )
                            ("@\\<\\(institute\\)" . 'font-lock-special-macro-face )
                            ("@\\<\\(meeting\\)" . 'font-lock-special-macro-face )
                            ("@\\<\\(slide\\)" . 'font-lock-special-macro-face )
                            ("@item\\|@subitem\\|@subsubitem" . 'font-lock-special-macro-face)
                            ("@header" . 'font-lock-special-macro-face)
                            ("@image" . 'font-lock-special-macro-face)
                            ("\\[\\([a-zA-Z0-9a-zA-Z0-9.,]+\\)\\]" . 'font-lock-special-args-face)
                            )
                          )
  )

(add-hook 'latex-mode-hook 'add-custom-keyw)

;; (setq buttkeywords
;;       '(("Sin\\|Cos\\|Sum" . font-lock-function-name-face)
;;         ("@\\<title\\>\\|@author\\|@meeting\\|@date\\|@slide\\|@image\\|@item" . font-lock-keyword-face)
;;         ("^[\#|\%]*" . font-lock-comment-face)
;;         )
;;       )

;; (define-derived-mode butt-mode latex-mode
;;   (setq font-lock-defaults '(buttkeywords))
;;   (setq mode-name "butt")
;;   )

(add-to-list 'auto-mode-alist '("\\.beam\\'" . latex-mode))

(provide 'beam-mode)
