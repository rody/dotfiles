;;; init-d2.el -- Configuration for d2lang -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package d2-mode
  :ensure t
  :ensure-system-package (d2 . "brew install d2")
  :after org
  :mode ("\\.d2\\'" . d2-mode)
  :commands
  (org-babel-execute:d2))

(provide 'init-d2)
;;; init-d2.el ends here
