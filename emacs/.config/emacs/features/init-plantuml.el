;;; init-plantuml.el -- configuration for plantuml -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package plantuml-mode
  :ensure t
  :mode (("\\.plantuml\\'" . plantuml-mode)
         ("\\.puml\\'" . plantuml-mode))
  :custom
    (plantuml-executable-path "/opt/homebrew/bin/plantuml")
    (plantuml-default-exec-mode 'executable))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
