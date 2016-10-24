(defun hlint ()
  "`hlint' the current file"
  (interactive)
  (shell-command 
   (format "hlint %s"
	   (shell-quote-argument (buffer-file-name))
	   )
   )
  (revert-buffer t t t)
  )
