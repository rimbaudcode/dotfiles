;;; rmbd-utils.el --- utility functions

;;; commentary:

;;; code:

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(defun display-gource ()
  "Run `gource' in the current `git' repo."
  (interactive)
  (shell-command (format "git gource")))

(defun hsplit-last-buffer ()
  "Horizontally split the last buffer after having opened a new buffer."
  (interactive)
  (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer))

(defun git-visual ()
  "Launch `git-visual' from within Emacs."
  (interactive)
  (shell-command (format "git visual")))

(defun open-current-folder-in-finder ()
  "`open' the current folder in `macOS' Finder."
  (interactive)
  (shell-command (format "open .")))

(defun shell-region (start end)
  "Execute a `shell-command' against region from START to END in an inferior shell."
  (interactive "r")
  (shell-command (buffer-substring-no-properties start end)))

(defun replace-current-buffer-file-extension-to (ext)
  "Replace the extension of the current buffer file to `.EXT'."
  (interactive)
  (concat (file-name-base (buffer-file-name)) ext))

(defun pandoc-infile-to-outfile (infile outfile)
  "Convert the type of an INFILE into an OUTFILE using `pandoc'."
  (interactive)
  (shell-command
   (format "pandoc %s -o %s"
           (shell-quote-argument infile)
           (shell-quote-argument outfile)))
  (revert-buffer t t t))

(defun pandoc-md-to-pdf ()
  "Convert the current `MD' buffer file into `PDF' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile
   (buffer-file-name)
   (replace-current-buffer-file-extension-to ".pdf"))
  (revert-buffer t t t))

(defun pandoc-md-to-docx ()
  "Convert the current `MD' buffer file into `docx' using `pandoc'."
  (interactive)
  (pandoc-infile-to-outfile
   (buffer-file-name)
   (replace-current-buffer-file-extension-to ".docx"))
  (revert-buffer t t t))

(defun reload-buffer ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun reload-emacs-init ()
  "Reloads Emacs .init (config file)."
  (load-file "~/.emacs.d/init.el"))

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.  Prefixed with negative \\[universal-argument], sort in reverse.  The variable `sort-fold-case' determines whether alphabetic case affects the sort order.  See `sort-regexp-fields'.  BEG.  END."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(defun transparency (value)
  "Set the transparency of the frame window.  VALUE: transparent/opaque: 0/100."
  (interactive "nTransparency: transparent-opaque: 0 - 100: ")
  (set-frame-parameter (selected-frame) 'alpha value)
  (set-background-color "ARGBBB000000"))

(defun vsplit-last-buffer ()
  "Vertically split the last buffer after having opened a new buffer."
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer))

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
;;
(provide 'rmbd-utils.el)
;;; rmbd-utils.el ends here
