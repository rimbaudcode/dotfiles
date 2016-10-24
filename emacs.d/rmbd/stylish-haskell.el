(defun stylish-haskell ()
  "`hlint' on the current file and revert the buffer"
  (interactive)
  (shell-command 
   (format "stylish-haskell -i %s"
	   (shell-quote-argument (buffer-file-name))
	   )
   )
  (revert-buffer t t t)
  )
