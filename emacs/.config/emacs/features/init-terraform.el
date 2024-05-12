;;; init-terraform.el -- Terraform/Opentofu related configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package terraform-mode
  :ensure t
  :mode (("\\.tf\\'" . terraform-mode))
  :custom
  (terraform-indent-level 4)
  (terraform-format-on-save t))

(provide 'init-terraform)
;;; init-terraform.el ends here
