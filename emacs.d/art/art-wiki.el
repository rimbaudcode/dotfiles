;;; art-wiki.el --- interface to `macOS''s `wiki' tool.

;;; commentary:

;;; code:

(require 'thingatpt)

(defun art-wiki-search-region (beg end)
  "Search the current marked string from BEG to END using `wiki'."
  (interactive "r")
  (let ((cmd (format "wiki -n %s"
                     (shell-quote-argument
                      (buffer-substring-no-properties beg end))))
        (temp-buffer-name "*wiki*"))
    (get-buffer-create temp-buffer-name)
    (shell-command cmd temp-buffer-name)
    (switch-to-buffer-other-window temp-buffer-name)
    (goto-char (point-min))
    (whitespace-cleanup)
    (special-mode)
    (visual-line-mode 1)))

(defun art-wiki-search-word-at-point ()
  "Search the current word under the cursor using `wiki'."
  (interactive)
  (let ((cmd (format "wiki -n %s"
                     (shell-quote-argument
                      (thing-at-point 'word 'NO-PROPERTIES))))
        (temp-buffer-name "*wiki*"))
    (get-buffer-create temp-buffer-name)
    (shell-command cmd temp-buffer-name)
    (switch-to-buffer-other-window temp-buffer-name)
    (goto-char (point-min))
    (whitespace-cleanup)
    (special-mode)
    (visual-line-mode 1)))

(provide 'art-wiki)
;;; art-wiki.el ends here