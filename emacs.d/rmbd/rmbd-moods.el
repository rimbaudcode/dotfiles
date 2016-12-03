;;; rmbd-moods.el --- coding, reading, and writing moods

;;; commentary:

;;; code:

(require 'darkroom)

(defun coding-mood ()
  "Setup Emacs in a coding environment."
  (interactive)
  (linum-mode 1)
  (fci-mode 1)
  (hl-line-mode 0)
  (read-only-mode 0)
  (visual-line-mode 0)
  (darkroom-tentative-mode 0))

(defun reading-mood ()
  "Setup Emacs in a reading environment."
  (interactive)
  (linum-mode 0)
  (fci-mode 0)
  (hl-line-mode 1)
  (read-only-mode 1)
  (visual-line-mode 1)
  (darkroom-tentative-mode 1))

(defun writing-mood ()
  "Setup Emacs in a non-distracting environment."
  (interactive)
  (linum-mode 0)
  (fci-mode 0)
  (hl-line-mode 0)
  (read-only-mode 0)
  (visual-line-mode 1)
  (darkroom-tentative-mode 1))

(provide 'rmbd-moods)
;;; rmbd-moods.el ends here
