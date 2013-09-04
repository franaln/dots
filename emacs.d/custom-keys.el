;; Keys for emacs! (and useful functions)
;; frani

(global-set-key "\C-l" 'goto-line)

(global-set-key "\C-h" 'delete-backward-char)

(global-set-key "\C-x\C-u" 'shell)

(global-set-key (kbd "C-c r") 'rename-this-file-and-buffer)

(global-set-key (kbd "C-c d") 'delete-this-file)

(global-set-key (kbd "M-SPC") 'multi-line-just-one-space)

(global-set-key (kbd "C-c +") 'increment-number-at-point)

(global-set-key (kbd "M-<left>") 'windmove-left)          ; move to left windnow
(global-set-key (kbd "M-<right>") 'windmove-right)        ; move to right window
(global-set-key (kbd "M-<up>") 'windmove-up)              ; move to upper window
(global-set-key (kbd "M-<down>") 'windmove-down)          ; move to downer window

(provide 'custom-keys)
