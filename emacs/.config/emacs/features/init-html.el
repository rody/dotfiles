;;; init-html.el -- configuration for html mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package mhtml-mode
  :ensure nil
  :mode (("\\.html?\\'" . mhtml-mode)))

(use-package emmet-mode
  :ensure t
  :hook ((mhtml-mode . emmet-mode)
         (html-mode . emmet-mode)))

(provide 'init-html)
;;; init-html.el ends here
