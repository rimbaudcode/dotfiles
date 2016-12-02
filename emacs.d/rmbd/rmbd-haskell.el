;;; rmbd-haskell.el --- `Haskell' utils on `Haskell' files.

;;; commentary:

;;; code:

(require 'thingatpt)

(defun run-shell-command-with-line (cmd)
  "Run the command CMD against the current line replacing it then with the CMD output."
  (move-beginning-of-line nil)
  (insert
   (shell-command-to-string (format "%s %s"
                                    (shell-quote-argument cmd)
                                    (shell-quote-argument
                                     (thing-at-point 'line 'NO-PROPERTIES)))))
  (kill-whole-line))

(defun run-pointfree-with-line ()
  "Run `pointfree' against the current line replacing it then with the `pointfree' output."
  (interactive)
  (run-shell-command-with-line "pointfree"))

(defun run-pointful-with-line ()
  "Run `pointfree' against the current line replacing it then with the `pointfree' output."
  (interactive)
  (run-shell-command-with-line "pointful"))

(defun run-stylish-haskell ()
  "Run `stylish-haskell' against the current file."
  (interactive)
  (shell-command (format "stylish-haskell -i %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(provide 'rmbd-haskell)
;;; rmbd-haskell.el ends here
