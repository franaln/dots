;; (add-to-list 'load-path "~/.emacs_plugins")

;; (setq visible-bell t)

;; ;; Emacs usually has a splash screen on startup.
;; (setq inhibit-startup-message t)

;; ;; Position of the vertical scrollbar. Useful for left-handers.
;; (set-scroll-bar-mode 'right)

;; ;; Cursor color
;; (set-cursor-color "white")

;; ; Change font size
;; ;;(set-face-attribute 'default nil :height 90)

;; ;; Entra en modo de coloreado por sintaxis
;; (global-font-lock-mode t)

;; ;; Muestra pares de paréntesis/corchetes/llaves
;; (require 'paren)
;; (show-paren-mode)
;; (setq show-paren-mismatch t)

;; ;; Si el nombre de dos archivos es igual, agrega el directorio para que el nombre del buffer sea único
;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; ;; Guardo los respaldos automáticos en ~/.saves/
;; (setq make-backup-files nil)
;; (setq version-control 'never)
;; (setq   backup-by-copying t   
;; 	backup-directory-alist   '(("." . "~/.saves"))  
;; 	delete-old-versions t 
;; 	kept-new-versions 6 
;; 	kept-old-versions 2
;; 	version-control t)  


;; ;; No seguir agregando líneas en blanco al final
;; (setq next-line-add-newlines nil)

;; ;; Hacer scroll línea por línea
;; (setq scroll-step 1)

;; ;; Muestra como título de la ventana/icono el nombre del archivo abierto (%f - filename, más largo. %b - buffer, más corto)
;; (setq frame-title-format "Emacs : %b")
;; (setq icon-title-format "Emacs : %b")

;; (custom-set-variables
;;  '(auto-compression-mode t nil (jka-compr))
;;  '(case-fold-search t)
;;  '(current-language-environment "UTF-8")
;;  '(default-input-method "rfc1345")
;;  '(global-font-lock-mode t nil (font-lock))
;;  '(show-paren-mode t nil (paren))
;;  '(transient-mark-mode t)
;;  '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))


;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; ;; -----------------------------------------------------------------------
;; ;; Autoloads (aka, the way to make emacs fast)
;; ;; -----------------------------------------------------------------------
;; (autoload 'hide-ifdef-define "hideif" nil t)
;; (autoload 'hide-ifdef-undef  "hideif" nil t)
;; (autoload 'c-mode "cc-mode" "C Editing Mode" t)
;; (autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
;; (autoload 'objc-mode "cc-mode" "ObjC Editing Mode" t)

;; (autoload 'go-mode "go-mode" "Major mode for editing Go source text." t nil)

;; ;; Autoloads to my custom header inserters
;; (autoload 'insert-c++-seperator-line "e-seperators" nil t)
;; (autoload 'insert-c-seperator-line "e-seperators" nil t)
;; (autoload 'insert-elisp-seperator-line "e-seperators" nil t)
;; (autoload 'insert-script-seperator-line "e-seperators" nil t)
;; (autoload 'insert-c-section-header "e-seperators" nil t)
;; (autoload 'insert-c++-section-header "e-seperators" nil t)
;; (autoload 'insert-elisp-section-header "e-seperators" nil t)
;; (autoload 'insert-script-section-header "e-seperators" nil t)
;; (autoload 'insert-c++-big-header "e-seperators" nil t)
;; (autoload 'insert-elisp-big-header "e-seperators" nil t)
;; (autoload 'insert-script-big-header "e-seperators" nil t)
;; (autoload 'insert-text-seperator-line "e-seperators" nil t)


;; ;;Shortcuts
;; (global-set-key "\C-l" 'goto-line)
;; (global-set-key "\C-h" 'delete-backward-char)
;; (global-set-key "\C-x\C-u" 'shell);

;; (line-number-mode 1)
;; (column-number-mode 1)
;; (fset 'yes-or-no-p 'y-or-n-p)


;; (defun select-next-window ()
;;   "Switch to the next window" 
;;   (interactive)
;;   (select-window (next-window)))

;; (defun select-previous-window ()
;;   "Switch to the previous window" 
;;   (interactive)
;;   (select-window (previous-window)))


;; (defun increment-number-at-point ()
;;   (interactive)
;;   (skip-chars-backward "0123456789")
;;   (or (looking-at "[0123456789]+")
;;       (error "No number at point"))
;;   (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

;; (global-set-key (kbd "C-c +") 'increment-number-at-point)


;; (defun turn-on-outline-minor-mode () (outline-minor-mode 1))

;; (add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode) 
;; (add-hook 'latex-mode-hook 'turn-on-outline-minor-mode) 
;; (setq outline-minor-mode-prefix "\C-c\C-o")

;; ;; (load "auctex.el" nil t t)
;; ;; (load "preview-latex.el" nil t t)


;; ;; (require 'flymake)

;; ;; (defun flymake-get-tex-args (file-name)
;; ;; (list "pdflatex"
;; ;; (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

;; ;; (add-hook 'LaTeX-mode-hook 'flymake-mode)



;; (setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
;; (setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports

;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;; (defun turn-on-outline-minor-mode ()
;; (outline-minor-mode 1))

;; (add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
;; (add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
;; (setq outline-minor-mode-prefix "C-cC-o") ; Or something else


;; ;; autopair
;; ;; (require 'autopair)
;; ;; (autopair-global-mode)

;; ;; corregir errores de pyhton
;; ;;(require 'python-pylint)

;; (when (fboundp 'windmove-default-keybindings)
;;   (windmove-default-keybindings))


;; (autoload 'markdown-mode "markdown-mode"
;;    "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (require 'edit-server)
;; (edit-server-start)

;; (autoload 'edit-server-maybe-dehtmlize-buffer "edit-server-htmlize" "edit-server-htmlize" t)
;; (autoload 'edit-server-maybe-htmlize-buffer   "edit-server-htmlize" "edit-server-htmlize" t)
;; (add-hook 'edit-server-start-hook 'edit-server-maybe-dehtmlize-buffer)
;; (add-hook 'edit-server-done-hook  'edit-server-maybe-htmlize-buffer)

;; ;; (require 'epy-completion)

;; ;; (require 'powerline)
;; ;; (setq powerline-arrow-shape 'arrow14)
;; ;; (custom-set-faces
;; ;;  '(mode-line ((t (:foreground "#000000" :background "#ffffff" :box nil))))
;; ;;  '(mode-line-inactive ((t (:foreground "#000000" :background "#ffffff" :box nil)))))

;; ;; autorefresh files
;; (global-auto-revert-mode t)

;; custom modeline
(setq-default mode-line-format (list "%m: " "buffer %b, " "line %l " "-- user: " (getenv "USER")))