;;; in emacs:
;; M-x load-file
;; ~/.emacs.d/rmbd/shell-region.lsp

;;; usage:
;; M-x shell-region

(defun shell-region (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command
   (buffer-substring-no-properties start end)
   )
  )
