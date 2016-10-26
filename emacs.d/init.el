;;; init.el --- Emacs config file
;;; Commentary:
;;; Code:
(package-initialize)
;;
(auto-package-update-maybe)
(setq auto-package-update-delete-old-versions t)
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-show-menu-immediately-on-auto-complete t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   (vector "#ffffff" "#bf616a" "#B4EB89" "#ebcb8b" "#89AAEB" "#C189EB" "#89EBCA" "#232830"))
 '(auto-save-interval 0)
 '(c-basic-offset 4)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "08851585c86abcf44bb1232bced2ae13bc9f6323aeda71adfa3791d6e7fea2b6" default)))
 '(electric-pair-mode t)
 '(fci-rule-color "#343d46")
 '(fci-rule-column nil)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
 '(global-flycheck-mode t)
 '(global-hl-line-mode nil)
 '(global-linum-mode t)
 '(global-visual-line-mode t)
 '(global-whitespace-mode nil)
 '(haskell-indentation-show-indentations t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(ido-enable-flex-matching t)
 '(ido-enable-last-directory-history nil)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(ispell-personal-dictionary nil)
 '(linum-format "%d ")
 '(make-backup-files nil)
 '(mc/always-run-for-all t)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (yasnippet swift3-mode markdown-mode auto-package-update multiple-cursors intero iedit hi2 haskell-tab-indent fill-column-indicator diminish auto-complete)))
 '(proof-splash-enable nil)
 '(server-mode nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(yas-also-auto-indent-first-line t)
 '(yas-global-mode t)
 '(yas-indent-line (quote nothing)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(whitespace-space ((t nil))))
;;
;; haskell indentation (choose one of the following three)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;
;; smex key-bindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;
;; flycheck haskell
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
;;
;; 80-line column indicator
;;
(require 'fill-column-indicator)
(set 'fci-rule-column 80)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
;;
;; *** MINE ***
;;
;; simpler prompts
;;
(fset 'yes-or-no-p 'y-or-n-p)
;;
;; multiple-cursors
;;
;; active region
(global-set-key (kbd "C-l") 'mc/edit-lines)
;;
;; keywords in buffer
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-r") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-r") 'mc/mark-all-like-this)
;;
(load-file "~/github/dotfiles/emacs.d/rmbd/haskell/rmbd-haskell.el")
(load-file "~/github/dotfiles/emacs.d/rmbd/utils/rmbd-utils.el")
;;
;; transparent frame
;;
(defun transparency (value)
  "Set the transparency of the frame window.  VALUE 0 = transparent/100 = opaque."
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value)
  (set-background-color "ARGBBB000000")
  )
;;
(transparency 100)
;;
(provide 'emacs)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
