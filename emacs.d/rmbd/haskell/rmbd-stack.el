;;; rmbd-stack.el --- functions to run `Haskell's `stack'.

;;; commentary:

;;; code:

(defun runhaskell ()
  "`runhaskell' the current file."
  (interactive)
  (shell-command
   (format "runhaskell %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t)
  )

(provide 'rmbd-stack.el)
;;; rmbd-stack.el ends here
