;;; init-json.el -- json support configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package jq-format
  :ensure t
  :demand t
  :after (json-mode json-ts-mode))

(use-package json-ts-mode
  :ensure nil
  :mode ("\\.json\\'" . json-ts-mode)
  :custom
  (json-ts-mode-indent-offset 4)
  :config
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist '(json "https://github.com/tree-sitter/tree-sitter-json" "master" "src"))))

(provide 'init-json)
;;; init-json.el ends here
