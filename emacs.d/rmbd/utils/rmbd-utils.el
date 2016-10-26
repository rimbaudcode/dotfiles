;;; rmbd-utils.el --- functions to run `cli' utils

;;; commentary:

;;; code:

(defun shell-region (start end)
  "Execute a `shell-command' against region from START to END in an inferior shell."
  (interactive "r")
  (shell-command (buffer-substring-no-properties start end))
  )

(defun replace-current-buffer-file-extension-to (ext)
  "Replace the extension of the current buffer file to `.EXT'."
  (interactive)
  (concat (file-name-base (buffer-file-name)) ext)
  )

(defun pandoc-infile-to-outfile (infile outfile)
  "Convert the type of an INFILE into an OUTFILE using `pandoc'."
  (interactive)
  (shell-command
   (format "pandoc %s -o %s"
           (shell-quote-argument infile)
           (shell-quote-argument outfile)
           )
   )
  (revert-buffer t t t)
  )

(defun pandoc-md-to-pdf ()
  "Convert the current `MD' buffer file into `PDF' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile
   (buffer-file-name)
   (replace-current-buffer-file-extension-to ".pdf")
   )
  (revert-buffer t t t)
  )

(defun pandoc-md-to-docx ()
  "Convert the current `MD' buffer file into `docx' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile
   (buffer-file-name)
   (replace-current-buffer-file-extension-to ".docx")
   )
  (revert-buffer t t t)
  )

(provide 'rmbd-utils.el)
;;;
;;; rmbd-utils.el ends here
