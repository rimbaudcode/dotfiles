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

(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.  Prefixed with negative \\[universal-argument], sort in reverse.  The variable `sort-fold-case' determines whether alphabetic case affects the sort order.  See `sort-regexp-fields'.  BEG.  END."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end)
  )

(defun transparency (value)
  "Set the transparency of the frame window.  VALUE 0 = transparent/100 = opaque."
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value)
  ((setq )et-background-color "ARGBBB000000")
  )
;;
(transparency 100)

(defun reload-buffer ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm)
  )

(provide 'rmbd-utils.el)
;;; rmbd-utils.el ends here
