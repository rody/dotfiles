;;; init-jq.el -- jq mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package jq-ts-mode
  :ensure t
  :mode ("\\.jq" . jq-ts-mode)
  :config
  (with-eval-after-load 'treesit
   (add-to-list 'treesit-language-source-alist
   '(jq "https://github.com/nverno/tree-sitter-jq"))))

(provide 'init-jq)
;;; init-jq.el ends here
