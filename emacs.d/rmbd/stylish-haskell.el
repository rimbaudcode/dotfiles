;;; in emacs:
;; M-x load-file
;; ~/.emacs.d/rmbd/stylish-haskell.lsp

;;; usage:
;; M-x stylish-haskell

(defun stylish-haskell ()
  "run `stylist-haskell` with the current file"
  (interactive)
  (shell-command-on-region
   ;; beginning and end of buffer
   (point-min)
   (point-max)
   ;; command and parameters
   "stylish-haskell -i"
   ;; output buffer
   (current-buffer)
   ;; replace?
   t
   ;; name of the error buffer
   "*Tidy Error Buffer*"
   ;; show error buffer?
   t)
  )
