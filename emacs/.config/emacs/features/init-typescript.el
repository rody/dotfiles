;;; init-typescript.el -- typescript configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; (use-package typescript-ts-mode
;;   :ensure nil
;;   :mode (("\\.ts\\'" . typescript-ts-mode)
;;          ("\\.tsx\\'" . typescript-ts-mode))
;;   :custom
;;   (typescript-indent-level 2)
;;   :config
;;   (with-eval-after-load 'treesit
;;     (add-to-list 'treesit-language-source-alist '(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))
;;   (with-eval-after-load 'treesit
;;     (add-to-list 'treesit-language-source-alist '(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))
;;   (unbind-key "M-." typescript-ts-base-mode-map))


(use-package jtsx
  :ensure t
  :mode (("\\.tsx\\'" . jtsx-tsx-mode)
         ("\\.ts\\'" . jtsx-typescript-mode)
         ("\\.jsx?\\'" . jtsx-jsx-mode))
  :hook ((jtsx-jsx-mode . hs-minor-mode)
         (jtsx-tsx-mode . hs-minor-mode)
         (jtsx-typescript-mode . hs-minor-mode))
  :config
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist '(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist '(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))))

(provide 'init-typescript)
;;; init-typescript.el ends here
