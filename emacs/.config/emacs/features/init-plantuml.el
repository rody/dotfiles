;;; init-plantuml.el -- configuration for plantuml -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package plantuml-mode
  :ensure t
  :mode (("\\.plantuml\\'" . plantuml-mode))
  :custom
    (setq plantuml-executable-path "/opt/homebrew/bin/plantuml")
    (setq plantuml-default-exec-mode 'executable))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
