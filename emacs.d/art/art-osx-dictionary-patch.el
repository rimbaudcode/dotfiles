;;; art-osx-dictionary-patch.el -- Summary

;;; Commentary:

;;; Code:

(require 'osx-dictionary)

(defun osx-dictionary--view-result (word)
  "Make buffer for the searching result of WORD."
  (if word
      (with-current-buffer (get-buffer-create osx-dictionary-buffer-name)
        (setq buffer-read-only nil)
        (erase-buffer)
        (let ((progress-reporter
               (make-progress-reporter (format "Searching (%s)..." word)
                                       nil nil)))
          (insert (osx-dictionary--search word))
          (progress-reporter-done progress-reporter))
        (osx-dictionary--goto-dictionary)
        (goto-char (point-min))
        ;;
        (whitespace-cleanup)
        (visual-line-mode)
        ;;
        (setq buffer-read-only t))
    (message "Nothing to look up")))

(provide 'art-osx-dictionary-patch)
;;; art-osx-dictionary-patch.el ends here
