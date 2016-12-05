;;; art-latexmk.el --- interface to `latexmk' for `TeX' files.

;;; commentary:

;;; code:

(require 'thingatpt)

(defun art-latexmk-build-current-buffer-file ()
  "Build the current (buffer) file using `latexmk'."
  (interactive)
  (let ((cmd (format "latexmk -xelatex -f -quiet %s" (shell-quote-argument (buffer-file-name))))
        (temp-buffer-name (get-buffer-create "*latexmk build*")))
    (async-shell-command cmd temp-buffer-name)))

(defun art-latexmk-clean-nonessential-files ()
  "Clean nonessential `TeX' files."
  (interactive)
  (shell-command (format "latexmk -c -quiet")))

(provide 'art-latexmk)
;;; art-latexmk.el ends here
