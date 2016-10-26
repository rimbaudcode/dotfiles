;;; rmbd-utils.el --- functions to run `cli' utils

;;; commentary:

;;; code:

(defun shell-region (start end)
  "Execute a `shell-command' against region from START to END in an inferior shell."
  (interactive "r")
  (shell-command (buffer-substring-no-properties start end))
  )

(defun convert-md-to-pdf ()
  "Convert the current buffer file into `PDF'."
  (interactive)
  (shell-command
   (format "pandoc %s -o %s"
           (shell-quote-argument (buffer-file-name))
           (shell-quote-argument (concat (file-name-base (buffer-file-name)) ".pdf"))
           )
   )
  (revert-buffer t t t)
  )

(defun convert-md-to-docx ()
  "Convert the current buffer file into `.docx'."
  (interactive)
  (shell-command
   (format "pandoc %s -o %s"
           (shell-quote-argument (buffer-file-name))
           (shell-quote-argument (concat (file-name-base (buffer-file-name)) ".docx"))
           )
   )
  (revert-buffer t t t)
  )

(provide 'rmbd-utils.el)
;;;
;;; rmbd-utils.el ends here
