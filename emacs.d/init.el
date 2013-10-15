;; emacs init
;; frani

;; turn off menubar/toolbar/scrollbar/splash screen
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d")

;; enter syntaxis color mode
(global-font-lock-mode t)

;; set up appearance
;;(require 'appearance)

;; show 
;; (require 'paren)
;; (show-paren-mode)
;; (setq show-paren-mismatch t)

;; tab == 4 spaces
(custom-set-variables
 '(tab-width 4))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . , "~/temp/emacs-backups/")))
(setq auto-save-file-name-transforms
      `((".*" , "~/temp/emacs-backups/" t)))

;; don't add blank lines at the end
(setq next-line-add-newlines nil)

;; scroll line by line
(setq scroll-step 1)

;; window title
(setq frame-title-format "emacs : %b")
(setq icon-title-format "emacs : %b")

;; save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(custom-set-variables
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))



;; switch windows with shift + arrows
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


;;-- plugins
(add-to-list 'load-path "~/.emacs.d/plugins")

;; Setup extensions
(require 'setup-yasnippet)

(require 'fold-this)
;;(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
;; (global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

;; highlight current line
;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#1a1c1d")


;; custom config
(require 'custom-modeline)
(require 'custom-fns)
(require 'custom-keys)

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

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
