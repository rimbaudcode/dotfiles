;;; art-utils.el --- utility functions

;;; commentary:

;;; code:

(defvar art-open-tool (executable-find "open")
  "Find and set `open' tool.")

(defun art-activity-monitor ()
  "Launch `Activity Monitor' using `macOS's `open' tool."
  (interactive)
  (shell-command "open '/Applications/Utilities/Activity Monitor.app'"))

(defun art-ansiweather ()
  "Run `ansiweather' from within Emacs."
  (interactive)
  (shell-command "ansiweather -l Leoben,AT -u metric -s true -d true"))

(defun art-copy-to-osx (beg end)
  "Copy the selected text, from BEG to END, to `macOS' pasteboard."
  (interactive "r")
  (shell-command (format "echo %s | pbcopy"
                         (shell-quote-argument
                          (buffer-substring-no-properties beg end)))))

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

(defun art-recompile-custom-code ()
  "Recompile directory with custom code: `~/.emacs/art'."
  (interactive)
  (byte-recompile-directory "~/.emacs.d/art" 0))

(defun art-recompile-emacs-code ()
  "Recompile directory with Emacs code: `~/.emacs/'."
  (interactive)
  (byte-recompile-directory "~/.emacs.d/" 0))

(defun art-reload-buffer ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun art-reload-emacs-init ()
  "Reloads Emacs .init (config file)."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun art-load-art-cmode ()
  "Load art-cmode."
  (interactive)
  (load-file "~/.emacs.d/art/art-cmode.el"))

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

(defun art-safari ()
  "Launch `iTunes' using `masOS' `open'."
  (interactive)
  (shell-command "open /Applications/Safari.app/"))

(defun art-save-buffer-as (filename)
  "Save the current buffer as a FILENAME provided interactively."
  (interactive "FSave as...: ")
  (write-region (point-min) (point-max) filename))

(defun art-scatter-csv (x-col y-col)
  "Draw a scatter plot of the `X-COL' and `Y-COL' of a `CSV' data file."
  (interactive "nColumn of X-data: \nnColumn of Y-data: ")
  (let ((csv-buffer-file-name (buffer-file-name))
        (temp-buffer-name
         (format "*scatter-csv: %s*" (file-name-base
                                      (buffer-file-name)))))
    (if (get-buffer temp-buffer-name)
        (kill-buffer temp-buffer-name))
    (get-buffer-create temp-buffer-name)
    (shell-command (format "scatter-csv %s %s %s"
                           x-col
                           y-col
                           csv-buffer-file-name)
                   temp-buffer-name)
    (switch-to-buffer-other-window temp-buffer-name)
    (whitespace-cleanup)
    (special-mode)))

(defun art-set-screen-brigthness (value)
  "Set the screnn bringhness to VALUE."
  (interactive "nBrigthness [0.0 - 1.0]: ")
  (shell-command (format "brightness %s" value)))

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

(defun art-sublime-buffer-file ()
  "Open this buffer file with `Sublime'."
  (interactive)
  (let ((open "open -a")
        (sublime-path "'/Applications/Sublime Text.app'"))
    (shell-command (format "%s %s %s" open sublime-path buffer-file-name))))

(defun art-start-time-machine-backup ()
  "Start `macOS's `TimeMachine' backup."
  (interactive)
  (shell-command "tmutil startbackup"))

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
