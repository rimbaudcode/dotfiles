;;; rmbd-pandoc.el --- interface to `pandoc' tool.

;;; commentary:

;;; code:

(defun pandoc-infile-to-outfile (infile outfile)
  "Convert the type of an INFILE into an OUTFILE using `pandoc'."
  (interactive)
  (shell-command (format "pandoc %s -o %s"
                         (shell-quote-argument infile)
                         (shell-quote-argument outfile))))

(defun pandoc-md-to-pdf ()
  "Convert the current `MD' buffer file into `PDF' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile (buffer-file-name)
                            (replace-current-buffer-file-extension-to ".pdf")))

(defun pandoc-md-to-docx ()
  "Convert the current `MD' buffer file into `docx' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile (buffer-file-name)
                            (replace-current-buffer-file-extension-to ".docx")))

(defun replace-current-buffer-file-extension-to (ext)
  "Replace the extension of the current buffer file to `.EXT'."
  (interactive)
  (concat (file-name-base (buffer-file-name)) ext))

(provide 'rmbd-pandoc)
;;; rmbd-pandoc.el ends here
