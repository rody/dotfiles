;;; init-pulsar.el -- pulsar configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package pulsar
  :ensure t
  :defer t
  :custom
  (pulsar-delay 0.055)
  (pulsar-iterations 10)
  (pulsar-face 'pulsar-yellow)
  (pulsar-highlight-face 'pulsar-yellow)
  :init
  ;; integration with the `consult' package:
  (add-hook 'consult-after-jump-hook #'pulsar-recenter-top)
  (add-hook 'consult-after-jump-hook #'pulsar-reveal-entry)

  ;; integration with the built-in `imenu':
  (add-hook 'imenu-after-jump-hook #'pulsar-recenter-top)
  (add-hook 'imenu-after-jump-hook #'pulsar-reveal-entry)
  (pulsar-global-mode +1))

(provide 'init-pulsar)
;;; init-pulsar.el ends here
