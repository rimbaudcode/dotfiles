;;; rmbd-say.el --- interface to `macOS''s `say' tool.

;;; commentary:

;;; code:

(require 'thingatpt)

(defun say-region-english (beg end)
  "Say the current marked string from BEG to END using `say'."
  (interactive "r")
  (let ((cmd (format "say -v Samantha %s"
                     (shell-quote-argument
                      (buffer-substring-no-properties beg end)))))
    (shell-command cmd)))

(defun say-word-english-at-point ()
  "Say the current word under the cursor using `say'."
  (interactive)
  (let ((cmd (format "say -v Samantha %s"
                     (shell-quote-argument
                      (thing-at-point 'word 'NO-PROPERTIES)))))
    (shell-command cmd)))

(provide 'rmbd-say)
;;; rmbd-say.el ends here
