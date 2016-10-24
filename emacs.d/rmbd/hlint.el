(defun hlint ()
  "`hlint' on the current file and revert the buffer"
  (interactive)
  (shell-command 
   (format "hlint %s"
	   (shell-quote-argument (buffer-file-name))
	   )
   )
  (revert-buffer t t t)
  )
