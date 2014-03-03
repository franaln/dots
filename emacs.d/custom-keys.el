;; -- emacs keys
;; frani

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; Move windows
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-left>")  'windmove-left)
(global-set-key (kbd "<s-up>")    'windmove-up)
(global-set-key (kbd "<s-down>")  'windmove-down)

;; move window borders
(global-set-key (kbd "M-{") 'move-border-left)
(global-set-key (kbd "M-}") 'move-border-right)

;; remap C-a to smarter-move-beginning-of-line
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; others
(global-set-key (kbd "C-c k")    'kill-other-buffers)
(global-set-key (kbd "C-c v")    'switch-src-header)
(global-set-key (kbd "C-c t")    'mo-toggle-identifier-naming-style)
(global-set-key (kbd "C-\"")     'toggle-quotes)
(global-set-key (kbd "C-l")     'goto-line)
(global-set-key (kbd "C-h")     'delete-backward-char)
(global-set-key (kbd "\C-x\C-u") 'shell)
(global-set-key (kbd "M-SPC")    'multi-line-just-one-space)
(global-set-key (kbd "C-c +")    'increment-number-at-point)
(global-set-key (kbd "C-c r")    'rename-this-file-and-buffer)
(global-set-key (kbd "C-c d")    'delete-this-file)
(global-set-key (kbd "C-x c")    'compile)
(global-set-key (kbd "M-s e")    'sudo-edit)
(global-set-key (kbd "C-c s")    'win-swap)

;; escape as C-g
(global-set-key (kbd "<escape>") 'keyboard-quit)


(provide 'custom-keys)
