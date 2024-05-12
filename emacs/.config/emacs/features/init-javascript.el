;;; init-javascript.el -- Configuration for the javasript laguage -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package js-ts-mode
  :ensure nil
  :mode (("\\.js\\'" . js-ts-mode))
  :custom
  (js-indent-level 4)
  :config
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist '(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")))
  (unbind-key "M-." js-ts-mode-map))

(provide 'init-javascript)
;;; init-javascript.el ends here
