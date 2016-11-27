;;; rmbd-config.el --- my configuration

;;; commentary:

;;; code:

;; delete-white-space on saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;
;; tell dired to use GNU ls (gls) instead of BSD ls
(setq insert-directory-program (executable-find "gls"))
;;
;; use tab to indent or complete
(setq tab-always-indent 'complete)
;;
;; open other windows vertically
(setq split-height-threshold nil)
(setq split-width-threshold 80)
;;
;; delete-white-space on saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;
;; tell dired to use GNU ls (gls) instead of BSD ls
(setq insert-directory-program (executable-find "gls"))
;;
;; use tab to indent or complete
(setq tab-always-indent 'complete)
;;
;; open other windows vertically
(setq split-height-threshold nil)
(setq split-width-threshold 80)
;;
;; simpler prompts
(fset 'yes-or-no-p 'y-or-n-p)
;;
;; multiple-cursors
;; active region
(global-set-key (kbd "C-l") 'mc/edit-lines)
;;
;; keywords in buffer
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-r") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-r") 'mc/mark-all-like-this)
;;
;; scrolling
;; NOTE: scrolling has the opposite direction of cursors!
(global-set-key (kbd "ESC <up>") 'scroll-down-command)
(global-set-key (kbd "ESC <down>") 'scroll-up-command)
;;
(provide 'rmbd-config.el)
;;; rmbd-config.el ends here
