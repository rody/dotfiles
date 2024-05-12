;;; init-typescript.el -- typescript configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package typescript-ts-mode
  :ensure nil
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . typescript-ts-mode))
  :custom
  (typescript-indent-level 2)
  :config
  (add-to-list 'treesit-language-source-alist '(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
  (add-to-list 'treesit-language-source-alist '(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
  (unbind-key "M-." typescript-ts-base-mode-map))

(provide 'init-typescript)
;;; init-typescript.el ends here
