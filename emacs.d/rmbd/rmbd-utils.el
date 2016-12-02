;;; rmbd-utils.el --- utility functions

;;; commentary:

;;; code:

(require 'darkroom)

(defun coding-mode ()
  "Setup Emacs in a coding environment."
  (interactive)
  (linum-mode 1)
  (fci-mode 1)
  (read-only-mode 0)
  (visual-line-mode 0)
  (darkroom-tentative-mode 0))

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

(defun open-current-buffer-file-externally ()
  "`open' the current buffer file with the default `macOS' app."
  (interactive)
  (shell-command (format "open %s" (buffer-file-name))))

(defun reading-mode ()
  "Setup Emacs in a reading environment."
  (interactive)
  (linum-mode 0)
  (fci-mode 0)
  (read-only-mode 1)
  (visual-line-mode 1)
  (darkroom-tentative-mode 1))

(defun reload-buffer ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun reload-emacs-init ()
  "Reloads Emacs .init (config file)."
  (interactive)
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

(defun replace-current-buffer-file-extension-to (ext)
  "Replace the extension of the current buffer file to `.EXT'."
  (interactive)
  (concat (file-name-base (buffer-file-name)) ext))

(defun save-buffer-as (filename)
  "Save the current buffer as a FILENAME provided interactively."
  (interactive "FSave as...: ")
  (write-region (point-min) (point-max) filename))

(defun shell-region (start end)
  "Execute a `shell-command' against region from START to END in an inferior shell."
  (interactive "r")
  (shell-command (buffer-substring-no-properties start end)))

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

(defun writing-mode ()
  "Setup Emacs in a non-distracting environment."
  (interactive)
  (linum-mode 0)
  (fci-mode 0)
  (read-only-mode 0)
  (visual-line-mode 1)
  (darkroom-tentative-mode 1))

(provide 'rmbd-utils)
;;; rmbd-utils.el ends here
