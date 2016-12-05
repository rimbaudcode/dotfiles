;;; art-haskell.el --- `Haskell' utils on `Haskell' files.

;;; commentary:

;;; code:

(require 'art-utils)
(require 'thingatpt)

(defun art-ghc-with-current-buffer-file ()
  "Compile the current buffer file name with `ghc'."
  (interactive)
  (shell-command (format "ghc --make %s" (buffer-file-name)))
  (message "ghc done."))

(defun art-pointfree-with-line ()
  "Run `pointfree' against the current line replacing it then with the `pointfree' output."
  (interactive)
  (art-shell-command-with-line "pointfree"))

(defun art-pointful-with-line ()
  "Run `pointfree' against the current line replacing it then with the `pointfree' output."
  (interactive)
  (art-shell-command-with-line "pointful"))

(defun art-stylish-haskell ()
  "Run `stylish-haskell' against the current file."
  (interactive)
  (shell-command (format "stylish-haskell -i %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(provide 'art-haskell)
;;; art-haskell.el ends here
