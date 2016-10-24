(defun stylish-haskell ()
  "`stylish-haskell' on the current file"
  (interactive)
  (shell-command
   (format "stylish-haskell -i %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t)
  )
