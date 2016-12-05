;;; init.el --- Emacs config file
;;; Commentary:

;;; Code:

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

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
 '(async-bytecomp-package-mode t)
 '(auto-save-interval 0)
 '(blink-cursor-blinks 0)
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(clean-buffer-list-delay-general 1)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "dark gray")
 '(cua-overwrite-cursor-color "dark gray")
 '(cursor-type (quote hollow))
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "08851585c86abcf44bb1232bced2ae13bc9f6323aeda71adfa3791d6e7fea2b6" default)))
 '(dired-async-mode t)
 '(dired-use-ls-dired nil)
 '(electric-pair-mode t)
 '(fci-rule-color "#383838")
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(global-aggressive-indent-mode t)
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
 '(global-flycheck-mode t)
 '(global-hl-line-mode nil)
 '(global-linum-mode nil)
 '(global-visual-line-mode nil)
 '(global-whitespace-mode nil)
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "es")
 '(haskell-indentation-show-indentations t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-flex-matching t)
 '(ido-enable-last-directory-history nil)
 '(ido-grid-mode t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(ispell-personal-dictionary nil)
 '(ivy-display-style nil)
 '(ivy-mode t)
 '(ivy-use-virtual-buffers t)
 '(keyboard-coding-system (quote utf-8-unix))
 '(linum-format "%3d ")
 '(make-backup-files nil)
 '(mc/always-run-for-all t)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(osx-clipboard-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (flycheck-stack flymake-hlint flymake-shell haskell-snippets osx-dictionary osx-lib osx-trash writeroom-mode wordsmith-mode which-key zenburn-theme counsel swiper ace-window org-bullets popwin deferred define-word google-this google-translate helm-hoogle helm-itunes aggressive-indent crux json-mode gnuplot-mode swift-mode magit-gitflow darkroom csv-mode flycheck-haskell smex yaml-mode magit yasnippet markdown-mode auto-package-update multiple-cursors intero iedit hi2 haskell-tab-indent fill-column-indicator diminish auto-complete)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(proof-splash-enable nil)
 '(ring-bell-function (quote ignore))
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
 '(which-key-mode t)
 '(yas-also-auto-indent-first-line t)
 '(yas-global-mode t)
 '(yas-indent-line (quote nothing)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 135 :width normal :foundry "nil" :family "Source Code Pro"))))
 '(aw-leading-char-face ((t (:foreground "red" :height 3.0))))
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
;; *** MINE ***
;;
;; gitflow
;;
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
;;
;; darkroom
;;
(require 'darkroom)
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
;; for cli:
(global-set-key (kbd "ESC <up>") 'scroll-down-command)
(global-set-key (kbd "ESC <down>") 'scroll-up-command)
;;
;; for gui:
(global-set-key (kbd "M-<up>") 'scroll-down-command)
(global-set-key (kbd "M-<down>") 'scroll-up-command)
;;
;; horizontally and vertically split last opened buffer
(global-set-key (kbd "C-x 3") 'hsplit-last-buffer)
(global-set-key (kbd "C-x 2") 'vsplit-last-buffer)
;;
;; moving-begining/end-of-line
(global-set-key (kbd "ESC a") 'move-beginning-of-line)
(global-set-key (kbd "ESC e") 'move-end-of-line)
;;
;; popwin
(require 'popwin)
(popwin-mode 1)
;;
;; org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;
;; buffer management
(defalias 'list-buffers 'ibuffer-other-window)
;;
;; window navigation
(global-set-key (kbd "M-p") 'ace-window)
;;
;; swiper
(global-set-key "\C-s" 'swiper)
(global-set-key "\C-r" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; load files with custom code
(add-to-list 'load-path "~/github/dotfiles/emacs.d/rmbd/")
;;
(load-library "rmbd-haskell")
(load-library "rmbd-latexmk")
(load-library "rmbd-moods")
(load-library "rmbd-pandoc")
(load-library "rmbd-say")
(load-library "rmbd-stack")
(load-library "rmbd-utils")
(load-library "rmbd-wiki")
;;
(require 'rmbd-haskell)
(require 'rmbd-latexmk)
(require 'rmbd-moods)
(require 'rmbd-pandoc)
(require 'rmbd-say)
(require 'rmbd-stack)
(require 'rmbd-utils)
(require 'rmbd-wiki)

(provide 'emacs)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
