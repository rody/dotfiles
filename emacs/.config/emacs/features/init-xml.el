;;; init-xml.el -- xml support configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package nxml-mode
  :ensure nil
  :mode (("\\.xml\\'" . nxml-mode)
         ("\\.dmn\\'" . nxml-mode))
  :custom
  (nxml-slash-auto-complete-flag t)
  (nxml-child-indent 4)
  (nxml-attribute-indent 8))

(provide 'init-xml)
;;; init-xml.el ends here
