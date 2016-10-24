(defun shell-region (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command (buffer-substring-no-properties start end))
  )
