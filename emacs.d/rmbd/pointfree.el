(defun pointfree ()
  "run `pointfree` with the current selected region"
  (interactive)
  (shell-command-on-region
   ;; beginning and end of selected region
   (region-beginning)
   (region-end)
   ;; command and parameters
   "pointfree --stdin"
   ;; output buffer
   (current-buffer)
   ;; replace?
   t
   ;; name of the error buffer
   "*Tidy Error Buffer*"
   ;; show error buffer?
   t)
  )
