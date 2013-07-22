;; Keys for emacs! (and useful functions)
;; frani

(global-set-key "\C-l" 'goto-line)

(global-set-key "\C-h" 'delete-backward-char)

(global-set-key "\C-x\C-u" 'shell)

(global-set-key (kbd "C-c r") 'rename-this-file-and-buffer)

(global-set-key (kbd "C-c d") 'delete-this-file)

;; M-space should remove multiple whitespace lines into a single blank
;; character
(global-set-key (kbd "M-SPC") 'multi-line-just-one-space)

;; increment number by one
(global-set-key (kbd "C-c +") 'increment-number-at-point)

(provide 'custom-keys)
