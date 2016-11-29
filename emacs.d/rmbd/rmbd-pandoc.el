;;; rmbd-pandoc.el --- interface to `pandoc' tool.

;;; commentary:

;;; code:

(defun pandoc-infile-to-outfile (infile outfile)
  "Convert the type of an INFILE into an OUTFILE using `pandoc'."
  (interactive)
  (shell-command
   (format "pandoc %s -o %s"
           (shell-quote-argument infile)
           (shell-quote-argument outfile)))
  (revert-buffer t t t))

(defun pandoc-md-to-pdf ()
  "Convert the current `MD' buffer file into `PDF' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile
   (buffer-file-name)
   (replace-current-buffer-file-extension-to ".pdf"))
  (revert-buffer t t t))

(defun pandoc-md-to-docx ()
  "Convert the current `MD' buffer file into `docx' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile
   (buffer-file-name)
   (replace-current-buffer-file-extension-to ".docx"))
  (revert-buffer t t t))

(provide 'rmbd-pandoc)
;;; rmbd-pandoc.el ends here
