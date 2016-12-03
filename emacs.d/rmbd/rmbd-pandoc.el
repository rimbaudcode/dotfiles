;;; rmbd-pandoc.el --- interface to `pandoc' tool.

;;; commentary:

;;; code:

(require 'rmbd-utils)

(defun pandoc-infile-to-outfile (infile outfile)
  "Convert the type of an INFILE into an OUTFILE using `pandoc'."
  (async-start
   (shell-command (format "pandoc %s -o %s"
                          (shell-quote-argument infile)
                          (shell-quote-argument outfile))))
  (message "pandoc %s to %s finished" infile outfile))

(defun pandoc-md-to-docx ()
  "Convert the current `MD' buffer file into `docx' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile (buffer-file-name)
                            (replace-current-buffer-file-extension-to ".docx")))

(defun pandoc-md-to-pdf ()
  "Convert the current `MD' buffer file into `PDF' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile (buffer-file-name)
                            (replace-current-buffer-file-extension-to ".pdf")))

(defun pandoc-md-to-pdf-xelatex ()
  "Pandoc current `MD' buffer file into `PDF' using `xelatex'."
  (interactive)
  (let ((infile (buffer-file-name))
        (outfile (replace-current-buffer-file-extension-to ".pdf")))
    (shell-command (format "pandoc %s -o %s --latex-engine=xelatex"
                           (shell-quote-argument infile)
                           (shell-quote-argument outfile)))
    (message "pandoc %s to %s finished" infile outfile)))

(provide 'rmbd-pandoc)
;;; rmbd-pandoc.el ends here
