;;; package --- emacs wrappers to run utils

;;; Commentary:

;;; Code:

(defun shell-region (start end)
  "Execute a `shell-command' against region from START to END in an inferior shell."
  (interactive "r")
  (shell-command (buffer-substring-no-properties start end))
  )

(provide 'rmbd-utils.el)
;;;
;;; rmbd-utils.el ends here
