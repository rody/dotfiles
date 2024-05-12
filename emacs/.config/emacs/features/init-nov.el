;;; init-nov.el -- configuration for nov.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package nov
  :ensure t
  :mode (("\\.epub\\'" . nov-mode)))

(provide 'init-nov)
;;; init-nov.el ends here
