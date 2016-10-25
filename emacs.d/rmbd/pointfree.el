;;; package --- run pointfree on current buffer
;;; Commentary:
;;;
;;; Code:

(defun pointfree ()
  "Run `pointfree` against the current selected region."
  (interactive)
  (when (region-active-p)
    (shell-command-on-region
     ;; beginning and end of selected region
     (region-beginning)
     (region-end)
     ;; command and parameters
     "pointfree --stdin"
     ;; output buffer
     (message "%s" (let ((string (buffer-substring
                                  (region-beginning)
                                  (region-end))))
                     (with-temp-buffer
                       (insert string)
                       (buffer-substring-no-properties
                        (point-min)
                        (point-max))))))
    ;; replace?
    t
    ;; name of the error buffer
    "*Tidy Error Buffer*"
    ;; show error buffer?
    t
    )
  )

(provide 'pointfree)

;;; pointfree.el ends here
