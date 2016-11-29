;;; rmbd-haskell.el --- `Haskell' utils on `Haskell' files.

;;; commentary:

;;; code:

(require 'thingatpt)

(defun run-shell-command-at-line (cmd)
  "Insert the result of running the shell command CMD with the current line as argument."
  (move-beginning-of-line nil)
  (insert
   (shell-command-to-string (format "%s %s"
                                    (shell-quote-argument cmd)
                                    (shell-quote-argument
                                     (thing-at-point 'line 'NO-PROPERTIES)))))
  (kill-whole-line))

(defun run-pointfree-at-line ()
  "Run `pointfree' against the current line replacing it with the `pointfree' output."
  (interactive)
  (run-shell-command-at-line "pointfree"))

(defun run-pointful-at-line ()
  "Run `pointfree' against the current line replacing it with the `pointfree' output."
  (interactive)
  (run-shell-command-at-line "pointful"))

(defun run-stylish-haskell ()
  "Run `stylish-haskell' against the current file."
  (interactive)
  (shell-command (format "stylish-haskell -i %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(provide 'rmbd-haskell.el)
;;; rmbd-haskell.el ends here
