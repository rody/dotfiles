;;; init-dimmer.el -- Configuration for dimmer.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dimmer
  :ensure t
  :defer 1
  :config
  (setq dimmer-fraction 0.4)
  (setq dimmer-adjustment-mode :foreground)
  (setq dimmer-use-colorspace :rgb)
  (dimmer-configure-magit)
  (dimmer-configure-posframe)
  (dimmer-configure-which-key)
  (dimmer-mode 1))

(provide 'init-dimmer)
;;; init-dimmer.el ends here
