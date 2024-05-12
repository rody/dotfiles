;;; init-image.el -- Configuration for image -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package image
  :ensure nil
  :defer t
  :custom
  ;; Enable converting external formats (ie. webp) to internal ones.
  (image-use-external-converter t))

(provide 'init-image)
;;; init-image.el ends here
