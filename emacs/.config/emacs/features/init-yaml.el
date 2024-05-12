;;; init-yaml.el -- Configuration for yaml -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package yaml-ts-mode
  :ensure nil
  :mode (("\\.ya?ml\\'" . yaml-ts-mode))
  :config
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "master" "src")))))

(use-package yaml-pro
  :ensure t
  :hook ((yaml-ts-mode yaml-ts-pro-mode)))

(provide 'init-yaml)
;;; init-yaml.el ends here
