;;; rmbd-latexmk.el --- interface to `latexmk' for `TeX' files.

;;; commentary:

;;; code:

(require 'rmbd-utils)
(require 'thingatpt)

(defun latexmk-build-current-buffer-file ()
  "Build the current (buffer) file using `latexmk'."
  (interactive)
  (let ((cmd (format "latexmk -xelatex -f -quiet %s" (shell-quote-argument (buffer-file-name))))
        (temp-buffer    (get-buffer-create "*latexmk build*")))
    (async-shell-command cmd temp-buffer)))

(defun latexmk-clean-nonessential-files ()
  "Clean nonessential `TeX' files."
  (interactive)
  (shell-command (format "latexmk -c -quiet")))

(defun latexmk-open-pdf ()
  "Open the `latexmk' generated `PDF' using `macOS' `open' utility."
  (interactive)
  (let ((cmd (format "open %s"
                     (shell-quote-argument
                      (replace-current-buffer-file-extension-to ".pdf")))))
    (shell-command cmd)))

(provide 'rmbd-latexmk)
;;; rmbd-latexmk.el ends here
