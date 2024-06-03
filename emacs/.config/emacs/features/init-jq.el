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

(use-package jq-mode
  :ensure t
  :commands (jq-interactively)
  :init
  (use-package ob-jq
    :after org
    :ensure nil
    :commands (org-babel-execute:jq)))

(provide 'init-jq)
;;; init-jq.el ends here
