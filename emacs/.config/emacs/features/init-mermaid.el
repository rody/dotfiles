;;; init-mermaid.el -- configuration for mermaid -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package mermaid-mode
  ;; my employer has disabled the use of chromium, so
  ;; mermaid is not an option anymore
  :disable t
  :ensure t
  :mode (("\\.mermaid\\'" . mermaid-mode))
  :custom
  (mermaid-tmp-dir (tepporary-file-directory)))

(provide 'init-mermaid)
;;; init-mermaid.el ends here
