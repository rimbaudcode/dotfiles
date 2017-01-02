;;; art-cmode.el -- remaps keys in cmode

;;; Commentary:

;;; Code:

(local-unset-key "C-d")
(local-set-key "C-d" 'mc/mark-all-like-this)

(provide 'art-cmode)
;;; art-cmode.el ends here
