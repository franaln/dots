;; -- emacs modeline
;; frani

(setq-default
 mode-line-format
 '(; Position, including warning for 80 columns
   (:propertize "%5l:" face mode-line-position-face)
   (:eval (propertize "%3c" 'face
                      (if (>= (current-column) 80)
                          'mode-line-80col-face
                        'mode-line-position-face)))
   ; emacsclient [default -- keep?]
   mode-line-client
   "  "
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize " Read Only " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " ** " 'face 'mode-line-modified-face))
          (t "      ")))
   "    "
   ; directory and buffer/file name
   (:propertize (:eval (shorten-directory default-directory 30))
                face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)
   ; narrow [default -- keep?]
   " %n "
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   (vc-mode vc-mode)
   "  %["
   (:propertize "("       face mode-line-mode-face)
   (:propertize mode-name face mode-line-mode-face)
   (:propertize ")"       face mode-line-mode-face)
   "%] "

   ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-80col-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-hostname-face)

(set-face-attribute 'mode-line nil
    :foreground "#aaaaaa" :background "#080809"
    :inverse-video nil
    :box '(:line-width 6 :color "#080809" :style nil))

(set-face-attribute 'mode-line-inactive nil
    :foreground "#aaaaaa" :background "gray5"
    :inverse-video nil
    :box '(:line-width 6 :color "gray5" :style nil))

(set-face-attribute 'mode-line-80col-face nil
    :inherit 'mode-line-face
    :foreground "#CE4045"
    :box '(:line-width 2 :color "blue"))

(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :background "#ffffff"
    :foreground "blue"
    :box '(:line-width 2 :color "blue"))

(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :foreground "#CE4045"
    :background "gray5"
    :box '(:line-width 2 :color "#CE4045"))

(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face)

(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#CE4045"
    :weight 'bold)

(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face
    :height 100)

(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "#63B2FA")

(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :height 110)

(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "red"
    :background "white")

(set-face-attribute 'mode-line-hostname-face nil
    :foreground "#4271ae"
    :background "gray5")

(provide 'modeline)
