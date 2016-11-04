;;; rmbd-stack.el --- functions to run `Haskell's `stack'.

;;; commentary:
;;
;; Running `stack --help' returns a list of "Available commands".  Some of which are implemented herein.

;;; code:

(defun stack-help ()
  "Show the help text."
  (interactive)
  (shell-command
   (format "stack --help"))
  (revert-buffer t t t)
  )

(defun stack-numeric-version ()
  "Show only version number."
  (interactive)
  (shell-command
   (format "stack --numeric-version"))
  (revert-buffer t t t)
  )

(defun stack-version ()
  "Show version."
  (interactive)
  (shell-command
   (format "stack --version"))
  (revert-buffer t t t)
  )

(defun stack-bench ()
  "Shortcut for 'build --bench'."
  (interactive)
  (shell-command
   (format "stack bench"))
  (revert-buffer t t t)
  )

(defun stack-build ()
  "Build the package(s) in this directory/configuration."
  (interactive)
  (shell-command
   (format "stack build"))
  (revert-buffer t t t)
  )

(defun stack-clean ()
  "Clean the local packages."
  (interactive)
  (shell-command
   (format "stack clean"))
  (revert-buffer t t t)
  )

(defun stack-dot ()
  "Visualize your project's dependency graph using Graphviz dot."
  (interactive)
  (shell-command
   (format "stack dot"))
  (revert-buffer t t t)
  )

(defun stack-haddock ()
  "Shortcut for 'build --haddock'."
  (interactive)
  (shell-command
   (format "stack haddock"))
  (revert-buffer t t t)
  )

(defun stack-init ()
  "Create stack project config from cabal or hpack package specifications."
  (interactive)
  (shell-command
   (format "stack init"))
  (revert-buffer t t t)
  )

(defun stack-install ()
  "Shortcut for 'build --copy-bins'."
  (interactive)
  (shell-command
   (format "stack install"))
  (revert-buffer t t t)
  )

(defun stack-list-dependencies ()
  "List the dependencies."
  (interactive)
  (shell-command
   (format "stack list-dependencies"))
  (revert-buffer t t t)
  )

(defun stack-path ()
  "Print out handy path information."
  (interactive)
  (shell-command
   (format "stack path"))
  (revert-buffer t t t)
  )

(defun stack-runhaskell ()
  "Run runghc (alias for 'runghc')."
  (interactive)
  (shell-command
   (format "stack runhaskell"))
  (revert-buffer t t t)
  )

(defun stack-sdist ()
  "Create source distribution tarballs."
  (interactive)
  (shell-command
   (format "stack sdist"))
  (revert-buffer t t t)
  )

(defun stack-setup ()
  "Get the appropriate GHC for your project."
  (interactive)
  (shell-command
   (format "stack setup"))
  (revert-buffer t t t)
  )

(defun stack-solver ()
  "Add missing extra-deps to stack project config."
  (interactive)
  (shell-command
   (format "stack solver"))
  (revert-buffer t t t)
  )

(defun stack-test ()
  "Shortcut for 'build --test'."
  (interactive)
  (shell-command
   (format "stack test"))
  (revert-buffer t t t)
  )

(defun stack-templates ()
  "List the templates available for `stack new'."
  (interactive)
  (shell-command
   (format "stack templates"))
  (revert-buffer t t t)
  )

(defun stack-unpack ()
  "Unpack one or more packages locally."
  (interactive)
  (shell-command
   (format "stack unpack"))
  (revert-buffer t t t)
  )

(defun stack-update ()
  "Update the package index."
  (interactive)
  (shell-command
   (format "stack update"))
  (revert-buffer t t t)
  )

(defun stack-upload ()
  "Upload a package to Hackage."
  (interactive)
  (shell-command
   (format "stack upload"))
  (revert-buffer t t t)
  )

(defun stack-exec (tool)
  "Execute TOOL."
  (interactive "sName of executable: ")
  (shell-command
   (format "stack exec %s" (shell-quote-argument tool)))
  (revert-buffer t t t)
  )

(defun stack-hoogle (term)
  "Run hoogle on TERM in the context of the current Stack config."
  (interactive "sTerm to be searched with hoogle: ")
  (shell-command
   (format "stack hoogle %s" (shell-quote-argument term)))
  (revert-buffer t t t)
  )

(defun stack-new (template)
  "Create a new project from a TEMPLATE.  Run `stack templates' to see available templates."
  (interactive "sStack template: ")
  (shell-command
   (format "stack new %s" (shell-quote-argument template)))
  (revert-buffer t t t)
  )

(provide 'rmbd-stack.el)
;;; rmbd-stack.el ends here
