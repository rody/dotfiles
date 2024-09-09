;;; init-emmet.el -- Emmet configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package emmet-mode
  :ensure t
  :hook (templ-ts-mode . emmet-mode))

(provide 'init-emmet)
;;; init-emmet.el ends here
