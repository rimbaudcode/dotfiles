;;; art-haskell.el --- `Haskell' utils on `Haskell' files.

;;; commentary:

;;; code:

(require 'art-utils)
(require 'thingatpt)

;;; find cli tools

(defvar art-ghc-tool (executable-find "ghc")
  "Find and set `ghc' tool.")

(defvar art-pointfree-tool (executable-find "pointfree")
  "Find and set `pointfree' tool.")

(defvar art-pointful-tool (executable-find "pointful")
  "Find and set `pointful' tool.")

(defvar art-stylish-haskell-tool (executable-find "stylish-haskell")
  "Find and set `stylish-haskell' tool.")

;;; functions

(defun art-ghc-against-buffer-file ()
  "Compile the current buffer file name with `ghc'."
  (interactive)
  (shell-command (format "%s --make %s" art-ghc-tool (buffer-file-name)))
  (message "ghc done."))

(defun art-pointfree-with-line ()
  "Run `pointfree' against the current line.
Replace it then with the `pointfree' output."
  (interactive)
  (art-shell-command-with-line art-pointfree-tool))

(defun art-pointful-with-line ()
  "Run `pointfree' against the current line.
Replace it with the `pointfree' output."
  (interactive)
  (art-shell-command-with-line art-pointful-tool))

(defun art-stylish-haskell ()
  "Run `stylish-haskell' against the current file."
  (interactive)
  (shell-command (format "%s -i %s"
                         art-stylish-haskell-tool
                         (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(provide 'art-haskell)
;;; art-haskell.el ends here
