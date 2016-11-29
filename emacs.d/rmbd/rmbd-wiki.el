;;; rmbd-wiki.el --- interface to `macOS''s `wiki' tool.

;;; commentary:

;;; code:

(defun wiki-search-region (start end)
  "Search the current string from START to END using `wiki'."
  (interactive "r")
  (shell-command
   (format "wiki -n '%s'" (buffer-substring-no-properties start end))))

(defun wiki-search-region-short (start end)
  "Search the current string from START to END using `wiki' short output."
  (interactive "r")
  (shell-command
   (format "wiki -short '%s'" (buffer-substring-no-properties start end))))

(provide 'rmbd-wiki)
;;; rmbd-wiki.el ends here
