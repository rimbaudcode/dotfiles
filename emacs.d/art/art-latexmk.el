;;; art-latexmk.el --- interface to `latexmk' for `TeX' files.

;;; commentary:

;;; code:

(require 'art-utils)
(require 'thingatpt)

(defvar art-latexmk-tool (executable-find "latexmk")
  "Find and set `latexmk' tool.")

(defvar art-preview-app "/Applications/Preview.app/"
  "Set `Preview' app path.")

(defvar art-skim-app "/Applications/Skim.app/"
  "Set `Skim' app path.")

(defun art-latexmk-build-current-buffer-file ()
  "Build the current (buffer) file using `latexmk'."
  (interactive)
  (let ((name "latexmk")
        (temp-buffer-name "*latexmk*"))
    (if (get-buffer temp-buffer-name)
        (kill-buffer temp-buffer-name))
    (get-buffer-create temp-buffer-name)
    (set-process-sentinel
     (start-process name
                    temp-buffer-name
                    art-latexmk-tool
                    "-xelatex"
                    "-f"
                    "-quiet"
                    (file-name-nondirectory (buffer-file-name)))
     #'output-message-sentinel)))
;;;
(defun output-message-sentinel (process msg)
  "Sentinel (worker) that follows PROCESS and displays its status as a MSG."
  (when (memq (process-status process) '(exit signal))
    (message (concat (process-name process) " - " msg)))
  (switch-to-buffer-other-window "*latexmk*")
  (goto-char (point-max))
  (whitespace-cleanup)
  (special-mode))

(defun art-latexmk-clean-nonessential-files ()
  "Clean nonessential `TeX' files."
  (interactive)
  (shell-command (format "%s -c -quiet" art-latexmk-tool)))

(defun art-open-bib-file-externally ()
  "Open `.bib' file with its default app using `macOS's `open' tool."
  (interactive)
  (let ((bib-file-path "doc/references.bib"))
    (shell-command (format "%s %s"
                           art-open-tool
                           bib-file-path))))

(defun art-view-pdf-named-as-buffer-with (viewerpath)
  "Open the `PDF' named as the current buffer using the VIEWERPATH app."
  (let ((pdf-file (art-replace-buffer-file-extension-to ".pdf"))
        (viewer-path viewerpath))
    (shell-command (format "%s -a %s %s"
                           art-open-tool
                           viewer-path
                           pdf-file))))

(defun art-skim-pdf-named-as-buffer ()
  "Open the `PDF' named as the current buffer using `Skim'."
  (interactive)
  (art-view-pdf-named-as-buffer-with art-skim-app))

(defun art-preview-pdf-named-as-buffer ()
  "Open the `PDF' named as the current buffer using `Preview'."
  (interactive)
  (art-view-pdf-named-as-buffer-with art-preview-app))

(provide 'art-latexmk)
;;; art-latexmk.el ends here
