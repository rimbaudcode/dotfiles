;;; rmbd-haskell.el --- functions to run `Haskell' utils on `Haskell' files.

;;; commentary:

;;; code:

(defun run-pointfree-at-line ()
  "Run `pointfree' against the current selected region."
  (interactive)
  (shell-command-on-region (line-beginning-position)
                           (line-end-position)
                           "pointfree --stdin"
                           nil
                           t))

(defun run-stylish-haskell ()
  "Run `stylish-haskell' against the current file."
  (interactive)
  (shell-command (format "stylish-haskell -i %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(provide 'rmbd-haskell.el)
;;; rmbd-haskell.el ends here
