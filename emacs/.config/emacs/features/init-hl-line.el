;;; init-hl-line.el -- Configuration for hl-line -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package hl-line
  :ensure nil
  :hook ((dired-mode . hl-line-mode)))

(provide 'init-hl-line)
;;; init-hl-line.el ends here
