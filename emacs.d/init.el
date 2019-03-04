;;; init.el --- Emacs config file
;;; Commentary:

;;; Code:

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (tooltip-mode -1))

;; so magit displays messages in English, rather than in ..., *cough*
(setenv "LANG" "en_US")

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
 '(aggressive-indent-excluded-modes
   (quote
    (makefile-mode makefile-gmake-mode text-mode yaml-mode haskell-mode python-mode wolfram-mode)))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   (vector "#ffffff" "#bf616a" "#B4EB89" "#ebcb8b" "#89AAEB" "#C189EB" "#89EBCA" "#232830"))
 '(async-bytecomp-package-mode t)
 '(auto-package-update-delete-old-versions t)
 '(auto-save-default nil)
 '(auto-save-interval 0)
 '(blink-cursor-blinks 0)
 '(blink-cursor-mode nil)
 '(byte-compile-delete-errors t)
 '(c-basic-offset 4)
 '(c-default-style "k&r")
 '(c-delete-function (quote mc/mark-all-like-this-dwim))
 '(clean-buffer-list-delay-general 1)
 '(column-number-mode t)
 '(company-global-modes t)
 '(counsel-mode nil)
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "dark gray")
 '(cua-overwrite-cursor-color "dark gray")
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "486759384769d44b22bb46072726c2cfb3ccc3d49342e5af1854784d505ffc01" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "08851585c86abcf44bb1232bced2ae13bc9f6323aeda71adfa3791d6e7fea2b6" default)))
 '(delete-selection-mode t)
 '(dired-async-mode t)
 '(dired-use-ls-dired nil)
 '(display-time-24hr-format t)
 '(electric-pair-mode t)
 '(exec-path-from-shell-check-startup-files nil)
 '(fci-rule-color "#383838")
 '(flyspell-lazy-mode t)
 '(global-aggressive-indent-mode t)
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
 '(global-company-mode t)
 '(global-hl-line-mode nil)
 '(global-linum-mode nil)
 '(global-visual-line-mode nil)
 '(global-whitespace-mode nil)
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "es")
 '(haskell-indentation-show-indentations t)
 '(haskell-interactive-prompt "\\> ")
 '(haskell-literate-default (quote tex))
 '(haskell-mode-hook (quote (intero-mode turn-on-haskell-indentation)) t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save nil)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-flex-matching t)
 '(ido-enable-last-directory-history nil)
 '(ido-grid-mode t)
 '(ido-ignore-buffers (quote ("\\` " "^\\*" "Setup.hs")))
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(intero-global-mode t nil (intero))
 '(intero-stack-executable "stack")
 '(ispell-personal-dictionary nil)
 '(ivy-display-style nil)
 '(ivy-mode t)
 '(ivy-use-virtual-buffers t)
 '(keyboard-coding-system (quote utf-8-unix))
 '(lice:default-license "bsd-3-clause")
 '(linum-format "%3d ")
 '(make-backup-files nil)
 '(mc/always-run-for-all t)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-babel-load-languages
   (quote
    ((scheme . t)
     (haskell . t)
     (sh . t)
     (ruby . t)
     (C . t)
     (latex . t)
     (emacs-lisp . t))))
 '(org-export-babel-evaluate nil)
 '(org-latex-minted-langs
   (quote
    ((emacs-lisp "common-lisp")
     (cc "c++")
     (cperl "perl")
     (shell-script "bash")
     (caml "ocaml")
     (haskell "haskell"))))
 '(org-latex-pdf-process
   (quote
    ("pdflatex -interaction nonstopmode -output-directory %o %f --shell-escape" "pdflatex -interaction nonstopmode -output-directory %o %f --shell-escape" "pdflatex -interaction nonstopmode -output-directory %o %f --shell-escape")))
 '(org-mode-hook
   (quote
    (#[nil "\300\301\302\303\304$\207"
           [org-add-hook change-major-mode-hook org-show-block-all append local]
           5]
     #[nil "\300\301\302\303\304$\207"
           [org-add-hook change-major-mode-hook org-babel-show-result-all append local]
           5]
     org-babel-result-hide-spec org-babel-hide-all-hashes
     #[nil "\300\301!\207"
           [org-bullets-mode 1]
           2]
     visual-line-mode)) t)
 '(org-src-preserve-indentation t)
 '(org-support-shift-select (quote always))
 '(osx-clipboard-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (matlab-mode define-word quack lice flymake-racket highlight2clipboard tuareg intero helm-gitignore evil flycheck-swift3 yasnippet-snippets spacegray-theme elpy anaconda-mode purescript-mode wolfram-mode geiser csharp-mode skeletor fsharp-mode emacsql-sqlite io-mode json-reformat rainbow-delimiters rainbow-identifiers racket-mode exec-path-from-shell 0blayout lua-mode flyspell-correct-helm flyspell-lazy helm-xcdoc helm-flyspell helm-google elixir-mode elixir-yasnippets flymake-hlint flymake-shell haskell-snippets osx-dictionary osx-lib osx-trash writeroom-mode wordsmith-mode which-key zenburn-theme counsel swiper org-bullets popwin deferred google-this google-translate helm-hoogle aggressive-indent crux json-mode gnuplot-mode swift-mode magit-gitflow darkroom csv-mode smex yaml-mode magit yasnippet markdown-mode auto-package-update multiple-cursors hi2 haskell-tab-indent fill-column-indicator diminish auto-complete)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(prog-mode-hook (quote (hilite-todos)))
 '(proof-splash-enable nil)
 '(ranger-override-dired nil)
 '(ranger-override-dired-mode nil)
 '(ranger-parent-depth 1)
 '(ring-bell-function (quote ignore))
 '(server-mode nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(skeletor-user-organisation "rimbaudcode")
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(user-full-name "Art Rimbaud")
 '(user-mail-address "rimbaudcode[aT]gmail<DoT>com")
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
 '(wolfram-indent 2)
 '(yas-also-auto-indent-first-line t)
 '(yas-global-mode t)
 '(yas-indent-line (quote nothing)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "default" :family "default"))))
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
;; *** MINE ***
;;
;; exec-path
;;
(exec-path-from-shell-initialize)
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
(global-set-key (kbd "C-t") 'mc/mark-next-like-this)
(global-set-key (kbd "C-r") 'mc/mark-all-like-this)
;; (global-set-key (kbd "C-r") 'mc/mark-previous-like-this)
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
(global-set-key (kbd "ESC A") 'move-beginning-of-line)
(global-set-key (kbd "ESC E") 'move-end-of-line)
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
;;
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;;
;; yasnippet
(setq warning-suppress-types nil)
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

;; load files with custom code
(add-to-list 'load-path (substitute-in-file-name "$HOME/github/dotfiles/emacs.d/art"))
;;
(require 'art-haskell)
(require 'art-latexmk)
(require 'art-moods)
(require 'art-pandoc)
(require 'art-stack)
(require 'art-utils)
(require 'art-wiki)
;;
(load-library "art-haskell")
(load-library "art-latexmk")
(load-library "art-moods")
(load-library "art-pandoc")
(load-library "art-stack")
(load-library "art-utils")
(load-library "art-wiki")
;;
(require 'c++11-mode)
(load-library "c++11-mode")
;;
;; hook to open .tex files
;;
(add-hook 'latex-mode-hook 'art-writing-mood)
;;
;; associate Tex .tex files to latex-mode
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
;;
;; mathematica
;;
;; associate Mathematica .wls files to wolfram-mode
;;
(add-to-list 'auto-mode-alist '("\\.wls\\'" . wolfram-mode))
;;
;; racket
;;
;; associate Racket .rkt files to racket-mode
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))
;;
;; hooks
(add-hook 'racket-mode-hook 'rainbow-delimiters-mode)
;;(add-hook 'racket-mode-hook 'auto-complete-mode)
;;
;;
;; scheme
;;
;; associate scheme .ss files to scheme-mode
(add-to-list 'auto-mode-alist '("\\.ss\\'" . scheme-mode))
;;
;;
;; octave
;; associate scheme .ss files to octave-mode
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
;;
;; added at the end of file by Emacs customization
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
;;
;; intero complaining
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)
;;
;; intero and hlint
;; do linting on-the-fly
(with-eval-after-load 'intero
  (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))
;;
;; purescript
;;(require 'psc-ide)
;;
(add-hook 'purescript-mode-hook
          (lambda ()
            (psc-ide-mode)
            (company-mode)
            (flycheck-mode)
            (turn-on-purescript-indentation)))
;;
;; flymake-racket mode
;;
;;(add-hook 'scheme-mode-hook #'flymake-racket-add-hook)
;;(add-hook 'racket-mode-hook #'flymake-racket-add-hook)
;;
;;
(provide 'emacs)
;;; init.el ends here
(put 'downcase-region 'disabled nil)
