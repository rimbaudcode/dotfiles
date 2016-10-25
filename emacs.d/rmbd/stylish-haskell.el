;;; package --- run stylish-haskell on the current file
;;; Commentary:
;;;
;;; Code:

(defun stylish-haskell ()
  "`stylish-haskell' on the current file."
  (interactive)
  (shell-command
   (format "stylish-haskell -i %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t)
  )
(provide 'stylish-haskell)

;;; stylish-haskell.el ends here
