;; -- emacs keys
;; frani

;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
;; (global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
;; (global-set-key (kbd "C-x C-c") 'delete-frame)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

(global-set-key (kbd "M-s M--") 'snakeify-current-word)

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;; Move windows, even in org-mode
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

(global-set-key "\C-l" 'goto-line)
(global-set-key "\C-h" 'delete-backward-char)

(global-set-key "\C-x\C-u" 'shell)

(global-set-key (kbd "M-SPC") 'multi-line-just-one-space)
(global-set-key (kbd "C-c +") 'increment-number-at-point)

(global-set-key (kbd "C-c r") 'rename-this-file-and-buffer)
(global-set-key (kbd "C-c d") 'delete-this-file)

(global-set-key (kbd "C-x c") 'compile)

;; remap C-a to smarter-move-beginning-of-line
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;;
;;(global-set-key (kbd "C-S up")  'move-line-up)
;;(global-set-key (kbd "C-S down")  'move-line-down)

(global-set-key (kbd "C-c k") 'kill-other-buffers)

(global-set-key (kbd "C-c C-v") 'atl-switch-src)

(provide 'custom-keys)
