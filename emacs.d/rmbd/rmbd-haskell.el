;;; rmbd-haskell.el --- `Haskell' utils on `Haskell' files.

;;; commentary:

;;; code:

(require 'rmbd-utils)
(require 'thingatpt)

(defun run-ghc-with-buffer-file ()
  "Compile the current buffer file name with `ghc'."
  (interactive)
  (shell-command (format "ghc --make %s" (buffer-file-name)))
  (message "ghc done."))

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
