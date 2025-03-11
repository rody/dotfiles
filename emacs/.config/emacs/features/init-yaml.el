;;; init-yaml.el -- Configuration for yaml -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (use-package yaml-ts-mode
;;   :ensure nil
;;   :mode (("\\.ya?ml\\'" . yaml-ts-mode))
;;   :hook ((yaml-ts-mode . eglot-ensure))
;;   :config
;;   (with-eval-after-load 'treesit
;;     (add-to-list 'treesit-language-source-alist
;;                  '(yaml . ("https://github.com/tree-sitter-grammars/tree-sitter-yaml" "master" "src")))))

(use-package yaml-mode
  :ensure nil
  :mode (("\\.ya?ml\\'" . yaml-mode))
  :hook ((yaml-mode . eglot-ensure)))

(provide 'init-yaml)
;;; init-yaml.el ends here
