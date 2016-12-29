;;; art-pandoc.el --- interface to `pandoc' tool.

;;; commentary:

;;; code:

(require 'art-utils)

(defvar art-pandoc-tool (shell-quote-argument (executable-find "pandoc"))
  "Find and set `pandoc' tool.")

(defun art-pandoc-infile-to-outfile (infile outfile)
  "Convert the type of an INFILE into an OUTFILE using `pandoc'."
  (async-start
   (shell-command (format "%s %s -o %s"
                          art-pandoc-tool
                          (shell-quote-argument infile)
                          (shell-quote-argument outfile))))
  (message "pandoc %s to %s finished" infile outfile))

(defun art-pandoc-md-to-docx ()
  "Convert the current `MD' buffer file into `docx' using `pandoc'."
  (interactive)
  (art-pandoc-infile-to-outfile
   (buffer-file-name)
   (art-replace-buffer-file-extension-to ".docx")))

(defun art-pandoc-md-to-pdf ()
  "Convert the current `MD' buffer file into `PDF' using `pandoc'."
  (interactive)
  (art-pandoc-infile-to-outfile
   (buffer-file-name)
   (art-replace-buffer-file-extension-to ".pdf")))

(defun art-pandoc-md-to-pdf-xelatex ()
  "Pandoc current `MD' buffer file into `PDF' using `xelatex'."
  (interactive)
  (let ((infile (buffer-file-name))
        (outfile (art-replace-buffer-file-extension-to ".pdf")))
    (shell-command (format "%s %s -o %s --latex-engine=xelatex"
                           art-pandoc-tool
                           (shell-quote-argument infile)
                           (shell-quote-argument outfile)))
    (message "pandoc %s to %s finished" infile outfile)))

(provide 'art-pandoc)
;;; art-pandoc.el ends here
