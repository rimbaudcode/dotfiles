;;; art-stack.el --- functions to run `Haskell's `stack'.

;;; commentary:
;;
;; Running `stack --help' returns a list of "Available commands".
;; Some of which are implemented herein.

;;; code:

(defun art-stack-with-opt (opt)
  "Run `stack' with the given OPT."
  (let ((temp-buffer-name "*stack*"))
    (if (get-buffer temp-buffer-name)
        (kill-buffer temp-buffer-name))
    (get-buffer-create temp-buffer-name)
    (switch-to-buffer-other-window temp-buffer-name)
    (shell-command (format "stack %s" (shell-quote-argument opt))
                   temp-buffer-name)
    (special-mode)))

(defun art-stack-help ()
  "Show the help text."
  (interactive)
  (art-stack-with-opt "--help"))

(defun art-stack-numeric-version ()
  "Show only version number."
  (interactive)
  (art-stack-with-opt "--numeric-version"))

(defun art-stack-version ()
  "Show version."
  (interactive)
  (art-stack-with-opt "--version"))

(defun art-stack-bench ()
  "Shortcut for 'build --bench'."
  (interactive)
  (art-stack-with-opt "bench"))

(defun art-stack-build ()
  "Build the package(s) in this directory/configuration."
  (interactive)
  (async-shell-command (format "stack build")
                       (get-buffer-create "*stack build*")))

(defun art-stack-clean ()
  "Clean the local packages."
  (interactive)
  (art-stack-with-opt "clean"))

(defun art-stack-dot ()
  "Visualize your project's dependency graph using Graphviz dot."
  (interactive)
  (art-stack-with-opt "dot"))

(defun art-stack-haddock ()
  "Shortcut for 'build --haddock'."
  (interactive)
  (art-stack-with-opt "haddock"))

(defun art-stack-init ()
  "Create stack project config from cabal or hpack package specifications."
  (interactive)
  (art-stack-with-opt "init"))

(defun art-stack-install ()
  "Shortcut for 'build --copy-bins'."
  (interactive)
  (art-stack-with-opt "install"))

(defun art-stack-list-dependencies ()
  "List the dependencies."
  (interactive)
  (art-stack-with-opt "list-dependencies"))

(defun art-stack-path ()
  "Print out handy path information."
  (interactive)
  (art-stack-with-opt "path"))

(defun art-stack-runhaskell ()
  "Run `runghc' (alias for `runghc')."
  (interactive)
  (let ((haskell-file-name (shell-quote-argument buffer-file-name))
        (temp-buffer-name "*stack*"))
    (if (get-buffer temp-buffer-name)
        (kill-buffer temp-buffer-name))
    (get-buffer-create temp-buffer-name)
    (switch-to-buffer-other-window temp-buffer-name)
    (shell-command (format "runhaskell %s" haskell-file-name)
                   temp-buffer-name)
    (message (buffer-file-name))
    (special-mode)))

(defun art-stack-sdist ()
  "Create source distribution tarballs."
  (interactive)
  (art-stack-with-opt "sdist"))

(defun art-stack-setup ()
  "Get the appropriate GHC for your project."
  (interactive)
  (art-stack-with-opt "setup"))

(defun art-stack-solver ()
  "Add missing extra-deps to stack project config."
  (interactive)
  (art-stack-with-opt "solver"))

(defun art-stack-test ()
  "Shortcut for 'build --test'."
  (interactive)
  (art-stack-with-opt "test"))

(defun art-stack-templates ()
  "List the templates available for `stack new'."
  (interactive)
  (art-stack-with-opt "templates"))

(defun art-stack-unpack ()
  "Unpack one or more packages locally."
  (interactive)
  (art-stack-with-opt "unpack"))

(defun art-stack-update ()
  "Update the package index."
  (interactive)
  (art-stack-with-opt "update"))

(defun art-stack-upload ()
  "Upload a package to Hackage."
  (interactive)
  (art-stack-with-opt "upload"))

(defun art-stack-exec (tool)
  "Execute TOOL."
  (interactive "sName of executable: ")
  (async-shell-command (format "stack exec %s" (shell-quote-argument tool))
                       (get-buffer-create "*stack exec*")))

(defun art-stack-hoogle (term)
  "Run hoogle on TERM in the context of the current Stack config."
  (interactive "sTerm to be searched with hoogle: ")
  (shell-command (format "stack hoogle %s" (shell-quote-argument term))))

(defun art-stack-new (template)
  "Create a new project from a TEMPLATE.
Run `stack templates' to see available templates."
  (interactive "sStack template: ")
  (shell-command (format "stack new %s" (shell-quote-argument template))))

(provide 'art-stack)
;;; art-stack.el ends here
