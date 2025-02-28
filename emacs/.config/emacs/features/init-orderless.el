;;; init-orderless.el -- Configuration for orderless -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless flex))
  (setq completion-category-defaults nil)
  ;;(setq completion-category-overrides '((eglot (styles . (orderless flex basic)))))
  (setq completion-category-overrides nil))

(provide 'init-orderless)
;;; init-orderless.el ends here
