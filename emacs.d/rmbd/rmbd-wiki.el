;;; rmbd-wiki.el --- interface to `macOS''s `wiki' tool.

;;; commentary:

;;; code:

(require 'thingatpt)

(defun wiki-search-region (start end)
  "Search the current marked string from START to END using `wiki'."
  (interactive "r")
  (shell-command
   (format "wiki -n '%s'" (buffer-substring-no-properties start end))))

(defun wiki-search-region-short (start end)
  "Search the current marked string from START to END using `wiki' short output."
  (interactive "r")
  (shell-command
   (format "wiki -short '%s'" (buffer-substring-no-properties start end))))

(defun wiki-search-word-at-point ()
  "Search the current word under the cursor using `wiki' short output."
  (interactive)
  (shell-command (format "wiki -n '%s'"
                         (thing-at-point 'word 'NO-PROPERTIES))))

(defun wiki-search-word-at-point-short ()
  "Search the current word under the cursor using `wiki' short output."
  (interactive)
  (shell-command (format "wiki -short '%s'"
                         (thing-at-point 'word 'NO-PROPERTIES))))

(provide 'rmbd-wiki)
;;; rmbd-wiki.el ends here
