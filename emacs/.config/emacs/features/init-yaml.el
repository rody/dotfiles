;;; init-yaml.el -- Configuration for yaml -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package yaml-ts-mode
  :ensure nil
  :mode (("\\.ya?ml\\'" . yaml-ts-mode))
  :hook ((yaml-ts-mode . flymake-mode))
  :config
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(yaml . ("https://github.com/tree-sitter-grammars/tree-sitter-yaml" "master" "src")))))

(use-package yaml-pro
  :ensure t
  :hook ((yaml-ts-mode . yaml-pro-ts-mode)))

(use-package flymake-yamllint
  :ensure t
  :hook (yaml-ts-mode . flymake-yamllint-setup))

(provide 'init-yaml)
;;; init-yaml.el ends here
