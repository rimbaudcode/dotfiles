;;; rmbd-stack.el --- functions to run `Haskell's `stack'.

;;; commentary:
;;
;; Running `stack --help' returns a list of "Available commands".  Some of which are implemented herein.

;;; code:

(defun run-stack-with-opt (opt)
  "Run `stack' with the given OPT."
  (shell-command (format "stack %s" (shell-quote-argument opt))))

(defun stack-help ()
  "Show the help text."
  (interactive)
  (run-stack-with-opt "--help"))

(defun stack-numeric-version ()
  "Show only version number."
  (interactive)
  (run-stack-with-opt "--numeric-version"))

(defun stack-version ()
  "Show version."
  (interactive)
  (run-stack-with-opt "--version"))

(defun stack-bench ()
  "Shortcut for 'build --bench'."
  (interactive)
  (run-stack-with-opt "bench"))

(defun stack-build ()
  "Build the package(s) in this directory/configuration."
  (interactive)
  (async-shell-command (format "stack build")
                       (get-buffer-create "*stack build: standard output*")
                       (get-buffer-create "*stack build: standard error*")))

(defun stack-clean ()
  "Clean the local packages."
  (interactive)
  (run-stack-with-opt "clean"))

(defun stack-dot ()
  "Visualize your project's dependency graph using Graphviz dot."
  (interactive)
  (run-stack-with-opt "dot"))

(defun stack-haddock ()
  "Shortcut for 'build --haddock'."
  (interactive)
  (run-stack-with-opt "haddock"))

(defun stack-init ()
  "Create stack project config from cabal or hpack package specifications."
  (interactive)
  (run-stack-with-opt "init"))

(defun stack-install ()
  "Shortcut for 'build --copy-bins'."
  (interactive)
  (run-stack-with-opt "install"))

(defun stack-list-dependencies ()
  "List the dependencies."
  (interactive)
  (run-stack-with-opt "list-dependencies"))

(defun stack-path ()
  "Print out handy path information."
  (interactive)
  (run-stack-with-opt "path"))

(defun stack-runhaskell ()
  "Run runghc (alias for 'runghc')."
  (interactive)
  (shell-command (format "stack runhaskell %s" (shell-quote-argument (buffer-file-name)))))

(defun stack-sdist ()
  "Create source distribution tarballs."
  (interactive)
  (run-stack-with-opt "sdist"))

(defun stack-setup ()
  "Get the appropriate GHC for your project."
  (interactive)
  (run-stack-with-opt "setup"))

(defun stack-solver ()
  "Add missing extra-deps to stack project config."
  (interactive)
  (run-stack-with-opt "solver"))

(defun stack-test ()
  "Shortcut for 'build --test'."
  (interactive)
  (run-stack-with-opt "test"))

(defun stack-templates ()
  "List the templates available for `stack new'."
  (interactive)
  (run-stack-with-opt "templates"))

(defun stack-unpack ()
  "Unpack one or more packages locally."
  (interactive)
  (run-stack-with-opt "unpack"))

(defun stack-update ()
  "Update the package index."
  (interactive)
  (run-stack-with-opt "update"))

(defun stack-upload ()
  "Upload a package to Hackage."
  (interactive)
  (run-stack-with-opt "upload"))

(defun stack-exec (tool)
  "Execute TOOL."
  (interactive "sName of executable: ")
  (async-shell-command (format "stack exec %s" (shell-quote-argument tool))
                       (get-buffer-create "*stack exec: standard output*")
                       (get-buffer-create "*stack exec: standard error*")))

(defun stack-hoogle (term)
  "Run hoogle on TERM in the context of the current Stack config."
  (interactive "sTerm to be searched with hoogle: ")
  (shell-command (format "stack hoogle %s" (shell-quote-argument term))))

(defun stack-new (template)
  "Create a new project from a TEMPLATE.  Run `stack templates' to see available templates."
  (interactive "sStack template: ")
  (shell-command (format "stack new %s" (shell-quote-argument template))))

(provide 'rmbd-stack)
;;; rmbd-stack.el ends here
