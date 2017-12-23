;;; art-moods.el --- coding, reading, and writing moods

;;; commentary:

;;; code:

(require 'darkroom)

(defun art-coding-mood ()
  "Setup an environment for coding."
  (interactive)
  (linum-mode 1)
  (fci-mode 1)
  (hl-line-mode 0)
  (read-only-mode 0)
  (visual-line-mode 0)
  (wordsmith-mode 0)
  (flyspell-mode 0)
  (reftex-mode 0)
  (delete-other-windows)
  (writeroom-mode 0)
  ;;(split-window-horizontally)
  )

(defun art-reading-mood ()
  "Setup a non-distracting environment for reading."
  (interactive)
  (linum-mode 0)
  (fci-mode 0)
  (hl-line-mode 1)
  (read-only-mode 1)
  (visual-line-mode 1)
  (wordsmith-mode 0)
  (flyspell-mode 0)
  (reftex-mode 0)
  (delete-other-windows)
  (writeroom-mode 1))

(defun art-writing-mood ()
  "Setup a non-distracting environment for writing."
  (interactive)
  (linum-mode 0)
  (fci-mode 0)
  (hl-line-mode 0)
  (read-only-mode 0)
  (visual-line-mode 1)
  (wordsmith-mode 0)
  (flyspell-mode 1)
  (reftex-mode 1)
  (delete-other-windows)
  (writeroom-mode 1))

(provide 'art-moods)
;;; art-moods.el ends here
