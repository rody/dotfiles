;;; init-ediff.el -- Configuration for ediff -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ediff
  :ensure nil
  :commands (ediff ediff-files ediff3 ediff-files3 ediff-revision ediff-regions-linewise ediff-regions-wordwise)
  :custom
  (ediff-keep-variants nil)
  (ediff-make-buffers-readonly-at-startup nil)
  (ediff-show-clashes-only t)
  (ediff-split-window-function 'split-window-horizontally)
  (ediff-window-setup-function 'ediff-setup-windows-plain))


(provide 'init-ediff)
;;; init-ediff.el ends here
