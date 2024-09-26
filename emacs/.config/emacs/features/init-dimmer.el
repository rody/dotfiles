;;; init-dimmer.el -- Configuration for dimmer.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dimmer
  :ensure t
  :defer t
  :custom
  (dimmer-fraction 0.4)
  (dimmer-adjustment-mode :foreground)
  (dimmer-use-colorspace :rgb)
  :init
  (dimmer-mode +1))

(provide 'init-dimmer)
;;; init-dimmer.el ends here
