;;; init-which-key.el -- configuration for which-key -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package which-key
  :ensure t
  :defer t
  :custom
  ;; Make which key panel only appear after C-h.
  ;; Helps with latency.
  (which-key-show-early-on-C-h t)
  (which-key-idle-delay 1)
  (which-key-idle-secondary-delay (float 0.05))
  :init
  (which-key-mode +1))

(provide 'init-which-key)
;;; init-which-key.el ends here
