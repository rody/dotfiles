;;; init-avy.el -- Avy configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t
  :bind (("M-s c" . #'avy-goto-char-timer)
         ("M-s w" . #'avy-goto-word-0)
         ("M-g g" . #'avy-goto-line)))

(provide 'init-avy)
;;; init-avy.el ends here
