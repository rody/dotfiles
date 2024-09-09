;;; init-avy.el -- Avy configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t
  :bind (("M-s c" . 'avy-g_oto-char-timer)
         ("M-g g" . 'avy-goto-line)))

(provide 'init-avy)
;;; init-avy.el ends here
