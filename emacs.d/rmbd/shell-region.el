;;; package --- run shell command on current region
;;; Commentary:
;;;
;;; Code:

(defun shell-region (start end)
  "Execute region from START to END in an inferior shell."
  (interactive "r")
  (shell-command (buffer-substring-no-properties start end))
  )

;;; shell-region.el ends here
