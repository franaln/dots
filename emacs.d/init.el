;; -- emacs init --
;; -- frani

;; turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; no splash screen please
(setq inhibit-startup-message t)

;; setup load path
(add-to-list 'load-path "~/.emacs.d")

;; enter syntaxis color mode
(global-font-lock-mode t)

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#1d1f20")
(set-face-foreground 'hl-line "#ffffff")

;; don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; show matching paretheses
(require 'paren)
(show-paren-mode)
(setq show-paren-mismatch t)

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

;; setup org
(eval-after-load 'org '(require 'setup-org))

;; setup extensions
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'setup-yasnippet)

;;(require 'indent-guide)
;;(indent-guide-global-mode)


;; sane defaults
(require 'sane-defaults)

;; custom config
(require 'custom-modeline)
(require 'custom-fns)
(require 'custom-keys)

;; run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; autoloads (aka, the way to make emacs fast)
(autoload 'hide-ifdef-define "hideif" nil t)
(autoload 'hide-ifdef-undef  "hideif" nil t)
(autoload 'c-mode "cc-mode" "C Editing Mode" t)
(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
(autoload 'objc-mode "cc-mode" "ObjC Editing Mode" t)
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

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; fix for shift+up (bug in xterm)
(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-xterm (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
