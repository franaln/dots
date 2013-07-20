;; emacs init
;; frani

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)
(setq visible-bell t)

(add-to-list 'load-path "~/.emacs.d")


;; Entra en modo de coloreado por sintaxis
(global-font-lock-mode t)

;; Muestra pares de paréntesis/corchetes/llaves
(require 'paren)
(show-paren-mode)
(setq show-paren-mismatch t)

;; custom config
(require 'custom-modeline)
(require 'custom-fns)
(require 'custom-keys)

;; Guardo los respaldos automáticos en ~/.saves/
(setq make-backup-files nil)
(setq version-control 'never)
(setq   backup-by-copying t   
	backup-directory-alist   '(("." . "~/.saves"))  
	delete-old-versions t 
	kept-new-versions 6 
	kept-old-versions 2
	version-control t) 

;; No seguir agregando líneas en blanco al final
(setq next-line-add-newlines nil)

;; Hacer scroll línea por línea
(setq scroll-step 1)

;; Muestra como título de la ventana/icono el nombre del archivo abierto (%f - filename, más largo. %b - buffer, más corto)
(setq frame-title-format "Emacs : %b")
(setq icon-title-format "Emacs : %b")

(custom-set-variables
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))


;; Autoloads (aka, the way to make emacs fast)
(autoload 'hide-ifdef-define "hideif" nil t)
(autoload 'hide-ifdef-undef  "hideif" nil t)
(autoload 'c-mode "cc-mode" "C Editing Mode" t)
(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
(autoload 'objc-mode "cc-mode" "ObjC Editing Mode" t)

;; Autoloads to my custom header inserters
(autoload 'insert-c++-seperator-line "e-seperators" nil t)
(autoload 'insert-c-seperator-line "e-seperators" nil t)
(autoload 'insert-elisp-seperator-line "e-seperators" nil t)
(autoload 'insert-script-seperator-line "e-seperators" nil t)
(autoload 'insert-c-section-header "e-seperators" nil t)
(autoload 'insert-c++-section-header "e-seperators" nil t)
(autoload 'insert-elisp-section-header "e-seperators" nil t)
(autoload 'insert-script-section-header "e-seperators" nil t)
(autoload 'insert-c++-big-header "e-seperators" nil t)
(autoload 'insert-elisp-big-header "e-seperators" nil t)
(autoload 'insert-script-big-header "e-seperators" nil t)
(autoload 'insert-text-seperator-line "e-seperators" nil t)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(fset 'yes-or-no-p 'y-or-n-p)


(defun select-next-window ()
  "Switch to the next window" 
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window" 
  (interactive)
  (select-window (previous-window)))


(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; autorefresh files
(global-auto-revert-mode t)

