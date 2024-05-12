;;; init-indent-bars.el -- configuration for indent-bars -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package indent-bars
  :ensure nil
  :load-path "~/workspaces/emacs/indent-bars"
  :bind (("C-c t i" . indent-bars-mode))
  :custom
  (indent-bars-display-on-blank-lines t)
  (indent-bars-treesit-support t)
  (indent-bars-no-descend-string t)
  (indent-bars-treesit-ignore-blank-lines-types '("module"))
  ;; appearence
  (indent-bars-pattern ". . ")
  (indent-bars-width-frac 0.25)
  (indent-bars-pad-frac 0.2)
  (indent-bars-color-by-depth nil)
  (indent-bars-color '(default :blend 1))
  (indent-bars-highlight-current-depth nil)
  )

(provide 'init-indent-bars)
;;; init-indent-bars.el ends here


(provide 'init-indent-bars)
;;; init-indent-bars.el ends here
