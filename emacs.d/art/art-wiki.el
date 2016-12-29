;;; art-wiki.el --- interface to `macOS''s `wiki' tool.

;;; commentary:

;;; code:

(require 'thingatpt)

(defvar art-wiki-tool (shell-quote-argument (executable-find "wiki"))
  "Find and set `wiki' tool.")

(defun art-wiki-search-region (beg end)
  "Search the current marked string from BEG to END using `wiki'."
  (interactive "r")
  (let ((cmd (format "%s -n %s"
                     art-wiki-tool
                     (shell-quote-argument
                      (buffer-substring-no-properties beg end))))
        (temp-buffer-name "*wiki*"))
    (get-buffer-create temp-buffer-name)
    (shell-command cmd temp-buffer-name)
    (switch-to-buffer-other-window temp-buffer-name)
    (goto-char (point-min))
    (whitespace-cleanup)
    (special-mode)
    (visual-line-mode)))

(defun art-wiki-search-word-at-point ()
  "Search the current word under the cursor using `wiki'."
  (interactive)
  (let ((cmd (format "%s -n %s"
                     art-wiki-tool
                     (shell-quote-argument
                      (thing-at-point 'word 'NO-PROPERTIES))))
        (temp-buffer-name "*wiki*"))
    (get-buffer-create temp-buffer-name)
    (shell-command cmd temp-buffer-name)
    (switch-to-buffer-other-window temp-buffer-name)
    (goto-char (point-min))
    (whitespace-cleanup)
    (special-mode)
    (visual-line-mode)))

(provide 'art-wiki)
;;; art-wiki.el ends here
