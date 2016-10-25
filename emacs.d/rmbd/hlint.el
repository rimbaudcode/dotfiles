;;; package --- run hlint on current file
;;; Commentary:
;;;
;;; Code:

(defun hlint ()
  "`hlint' the current file."
  (interactive)
  (shell-command
   (format "hlint %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t)
  )

(provide 'hlint)

;;; hlint.el ends here
