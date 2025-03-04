;;; init-which-key.el -- configuration for which-key -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package which-key
  :ensure t
  :defer 1
  :config
  ;; Make which key panel only appear after C-h.
  ;; Helps with latency.
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay 1)
  (setq which-key-add-column-padding 2)
  (setq which-key-min-display-lines 6)
  (setq which-key-idle-secondary-delay (float 0.05))
  (which-key-mode +1))

(provide 'init-which-key)
;;; init-which-key.el ends here
