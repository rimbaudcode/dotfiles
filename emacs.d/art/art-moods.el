;;; art-moods.el --- coding, reading, and writing moods

;;; commentary:

;;; code:

(require 'darkroom)

(defun art-coding-mood ()
  "Setup Emacs in a coding environment."
  (interactive)
  (linum-mode 1)
  (fci-mode 1)
  (hl-line-mode 0)
  (read-only-mode 0)
  (visual-line-mode 0)
  (wordsmith-mode 0)
  (delete-other-windows)
  (darkroom-tentative-mode 0))

(defun art-reading-mood ()
  "Setup Emacs in a reading environment."
  (interactive)
  (linum-mode 0)
  (fci-mode 0)
  (hl-line-mode 1)
  (read-only-mode 1)
  (visual-line-mode 1)
  (wordsmith-mode 0)
  (delete-other-windows)
  (darkroom-tentative-mode 1))

(defun art-writing-mood ()
  "Setup Emacs in a non-distracting environment."
  (interactive)
  (linum-mode 0)
  (fci-mode 0)
  (hl-line-mode 0)
  (read-only-mode 0)
  (visual-line-mode 1)
  (wordsmith-mode 1)
  (delete-other-windows)
  (darkroom-tentative-mode 1))

(provide 'art-moods)
;;; art-moods.el ends here
