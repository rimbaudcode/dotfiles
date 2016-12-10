;;; art-latexmk.el --- interface to `latexmk' for `TeX' files.

;;; commentary:

;;; code:

(require 'thingatpt)

(defun art-latexmk-build-current-buffer-file ()
  "Build the current (buffer) file using `latexmk'."
  (interactive)
  (let ((cmd (format "latexmk -xelatex -f -quiet %s"
                     (shell-quote-argument (buffer-file-name))))
        (temp-buffer-name (get-buffer-create "*latexmk*")))
    (async-shell-command cmd temp-buffer-name)))

(defun art-latexmk-clean-nonessential-files ()
  "Clean nonessential `TeX' files."
  (interactive)
  (shell-command (format "latexmk -c -quiet")))

(defun art-open-bib-file-externally ()
  "Open `.bib' file with its default app using `macOS's `open' tool."
  (interactive)
  (let ((bib-file-path "./doc/references.bib"))
    (shell-command (format "open %s" bib-file-path))))

(provide 'art-latexmk)
;;; art-latexmk.el ends here
