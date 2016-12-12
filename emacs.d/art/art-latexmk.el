;;; art-latexmk.el --- interface to `latexmk' for `TeX' files.

;;; commentary:

;;; code:

(require 'art-utils)
(require 'thingatpt)

(defun art-latexmk-build-current-buffer-file ()
  "Build the current (buffer) file using `latexmk'."
  (interactive)
  (set-process-sentinel
   (start-process
    "latexmk"
    "*latexmk*"
    "latexmk"
    "-xelatex" "-f" "-quiet" (shell-quote-argument (buffer-file-name)))
   #'output-message-sentinel))
;;;
(defun output-message-sentinel (process msg)
  (when (memq (process-status process) '(exit signal))
    (message (concat (process-name process) " - " msg))))

(defun art-latexmk-clean-nonessential-files ()
  "Clean nonessential `TeX' files."
  (interactive)
  (shell-command (format "latexmk -c -quiet")))

(defun art-open-bib-file-externally ()
  "Open `.bib' file with its default app using `macOS's `open' tool."
  (interactive)
  (let ((bib-file-path "./doc/references.bib"))
    (shell-command (format "open %s" bib-file-path))))

(defun art-view-pdf-named-as-buffer-with (viewerpath)
  "Open the `PDF' named as the current buffer using the VIEWERPATH app."
  (let ((pdf-file (art-replace-buffer-file-extension-to ".pdf"))
        (cmd "open -a")
        (viewer-path viewerpath))
    (shell-command (format "%s %s %s" cmd viewer-path pdf-file))))

(defun art-skim-pdf-named-as-buffer ()
  "Open the `PDF' named as the current buffer using `Skim'."
  (interactive)
  (art-view-pdf-named-as-buffer-with "/Applications/Skim.app/"))

(defun art-preview-pdf-named-as-buffer ()
  "Open the `PDF' named as the current buffer using `Preview'."
  (interactive)
  (art-view-pdf-named-as-buffer-with "/Applications/Preview.app/"))

(provide 'art-latexmk)
;;; art-latexmk.el ends here
