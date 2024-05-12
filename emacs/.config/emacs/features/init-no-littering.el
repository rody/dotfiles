;;; init-no-littering.el -- no-littering configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package no-littering
  :ensure t
  :init
  (with-eval-after-load 'recentf
    (add-to-list 'recentf-exclude
                 (recentf-expand-file-name no-littering-var-directory))
    (add-to-list 'recentf-exclude
                 (recentf-expand-file-name no-littering-etc-directory))))

(provide 'init-no-littering)
;;; init-no-littering.el ends here
