;;; rmbd-haskell.el --- functions to run `Haskell' utils on `Haskell' files.

;;; commentary:

;;; code:

(defun hlint ()
  "`hlint' the current file."
  (interactive)
  (shell-command
   (format "hlint %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(defun pointfree ()
  "Run `pointfree' against the current selected region."
  (interactive)
  (when (region-active-p)
    (shell-command-on-region
     ;; beginning and end of selected region
     (region-beginning)
     (region-end)
     ;; command and parameters
     "pointfree --stdin"
     ;; output buffer
     (message "%s" (let ((string (buffer-substring
                                  (region-beginning)
                                  (region-end))))
                     (with-temp-buffer
                       (insert string)
                       (buffer-substring-no-properties
                        (point-min)
                        (point-max))))))
    ;; replace?
    t
    ;; name of the error buffer
    "*Pointfree Error Buffer*"
    ;; show error buffer?
    t))

(defun stylish-haskell ()
  "`stylish-haskell' on the current file."
  (interactive)
  (shell-command
   (format "stylish-haskell -i %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(provide 'rmbd-haskell.el)
;;; rmbd-haskell.el ends here
