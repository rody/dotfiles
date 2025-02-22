;;; init-imenu.el -- configuration for imenu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package imenu
  :ensure nil
  :demand t
  :custom
  (imenu-sort-function 'imenu--sort-by-name)
  (imenu-max-item-length 120))

(use-package imenu-list
  :ensure t
  :bind (("C-'" . imenu-list-smart-toggle)
         ("C-c t m" . imenu-list-smart-toggle))
  :custom
  (imenu-list-focus-after-activation t))

(provide 'init-imenu)
;;; init-imenu.el ends here
