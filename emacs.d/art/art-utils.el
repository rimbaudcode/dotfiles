;;; art-utils.el --- utility functions

;;; commentary:

;;; code:

(defun art-ansiweather ()
  "Run `ansiweather' from within Emacs."
  (interactive)
  (shell-command "ansiweather -l Leoben,AT -u metric -s true -d true"))

(defun art-delete-file-and-buffer ()
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

(defun art-display-gource ()
  "Run `gource' in the current `git' repo."
  (interactive)
  (shell-command "git gource"))

(defun art-git-visual ()
  "Launch `git-visual' from within Emacs."
  (interactive)
  (shell-command "git visual"))

(defun art-insert-elisp-script-header ()
  "Insert Emacs Lisp header as recommended by `flycheck'."
  (interactive)
  (let ((package-string (format ";;; %s -- Summary\n\n"
                                (file-name-nondirectory (buffer-file-name))))
        (commentary-string ";;; Commentary:\n\n")
        (code-string ";;; Code:\n\n")
        (code-here-string "\n\n")
        (provide-string (format "(provide '%s)\n"
                                (file-name-sans-extension
                                 (file-name-nondirectory (buffer-file-name)))))
        (end-string (format ";;; %s ends here\n"
                            (file-name-nondirectory (buffer-file-name)))))
    (insert package-string)
    (insert commentary-string)
    (insert code-string)
    (insert code-here-string)
    (insert provide-string)
    (insert end-string)
    (forward-line -4)))

(defun art-istats ()
  "Run `istats' from within Emacs."
  (interactive)
  (let ((cmd "istats --no-graphs")
        (temp-buffer-name "*istats*"))
    (get-buffer-create temp-buffer-name)
    (shell-command cmd temp-buffer-name)
    (switch-to-buffer-other-window temp-buffer-name)
    (goto-char (point-max))
    (whitespace-cleanup)
    (special-mode)))

(defun art-itunes ()
  "Launch `iTunes' using `masOS' `open'."
  (interactive)
  (shell-command "open /Applications/iTunes.app/"))

(defun art-safari ()
  "Launch `iTunes' using `masOS' `open'."
  (interactive)
  (shell-command "open /Applications/Safari.app/"))

(defun art-recompile-custom-code-dir ()
  "Recompile directory with custom code: `~/.emacs/art'."
  (interactive)
  (byte-recompile-directory "~/.emacs.d/art" 0))

(defun art-reload-buffer ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun art-reload-emacs-init ()
  "Reloads Emacs .init (config file)."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun art-rename-file-and-buffer ()
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

(defun art-replace-buffer-file-extension-to (ext)
  "Replace the extension of the current buffer file to `.EXT'."
  (interactive)
  (concat (file-name-base (buffer-file-name)) ext))

(defun art-save-buffer-as (filename)
  "Save the current buffer as a FILENAME provided interactively."
  (interactive "FSave as...: ")
  (write-region (point-min) (point-max) filename))

(defun art-shell-command-with-line (cmd)
  "Run the command CMD against the current line.
Replace it then with the CMD output."
  (move-beginning-of-line nil)
  (insert
   (shell-command-to-string (format "%s %s"
                                    (shell-quote-argument cmd)
                                    (shell-quote-argument
                                     (thing-at-point 'line 'NO-PROPERTIES)))))
  (kill-whole-line))

(defun art-sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
Prefixed with negative \\[universal-argument], sort in reverse.
The variable `sort-fold-case' determines whether alphabetic case affects
the sort order.  See `sort-regexp-fields'.  BEG.  END."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(defun art-transparency (value)
  "Set the transparency of the frame window.  VALUE: transparent/opaque: 0/100."
  (interactive "nTransparency: transparent-opaque: 0 - 100: ")
  (set-frame-parameter (selected-frame) 'alpha value)
  (set-background-color "ARGBBB000000"))

(defun hsplit-last-buffer ()
  "Horizontally split the last buffer after having opened a new buffer."
  (interactive)
  (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer))

(defun vsplit-last-buffer ()
  "Vertically split the last buffer after having opened a new buffer."
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer))

(provide 'art-utils)
;;; art-utils.el ends here
