;;; rmbd-wiki.el --- interface to `macOS''s `wiki' tool.

;;; commentary:

;;; code:

(require 'thingatpt)

(defun wiki-search-current-region (opt start end)
  "Search the current marked region, using `wiki' passing to it an OPT, from START to END."
  (shell-command (format "wiki %s %s" opt
                         (shell-quote-argument (buffer-substring-no-properties start end)))))

(defun wiki-search-region (start end)
  "Search the current marked string from START to END  `wiki'."
  (interactive "r")
  (wiki-search-current-region "-n" start end))

(defun wiki-search-region-short (start end)
  "Search the current marked string from START to END using `wiki' short output."
  (interactive "r")
  (wiki-search-current-region "-short" start end))

(defun wiki-search-current-word-at-point (opt)
  "Search the current word under the cursor using `wiki' and passing to it an OPT."
  (shell-command (format "wiki %s %s" opt
                         (shell-quote-argument (thing-at-point 'word 'NO-PROPERTIES)))))

(defun wiki-search-word-at-point ()
  "Search the current word under the cursor using `wiki' short output."
  (interactive)
  (wiki-search-current-word-at-point "-n"))

(defun wiki-search-word-at-point-short ()
  "Search the current word under the cursor using `wiki' short output."
  (interactive)
  (wiki-search-current-word-at-point "-short"))

(provide 'rmbd-wiki)
;;; rmbd-wiki.el ends here
