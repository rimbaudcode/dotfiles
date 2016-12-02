;;; rmbd-latexmk.el --- interface to `latexmk' for `TeX' files.

;;; commentary:

;;; code:

(require 'thingatpt)


;; latexmk -xelatex

(defun latexmk-build-current-buffer-file ()
  "Build the current (buffer) file using `latexmk'."
  (interactive)
  (async-shell-command (format "latexmk -xelatex -f -quiet %s" (shell-quote-argument (buffer-file-name)))
                       (get-buffer-create "*latexmk build: standard output*")
                       (get-buffer-create "*latexmk build: standard error*")))

(defun latexmk-clean-nonessential-files ()
  "Clean nonessential `TeX' files."
  (interactive)
  (shell-command (format "latexmk -c -quiet")))

(defun latexmk-open-pdf ()
  "Open the `latexmk' generated `PDF' using `macOS' `open' utility."
  (interactive)
  (shell-command
   (format "open %s"
           (shell-quote-argument
            (replace-current-buffer-file-extension-to ".pdf")))))

(defun replace-current-buffer-file-extension-to (ext)
  "Replace the extension of the current buffer file to `.EXT'."
  (interactive)
  (concat (file-name-base (buffer-file-name)) ext))

(provide 'rmbd-latexmk)
;;; rmbd-latexmk.el ends here
