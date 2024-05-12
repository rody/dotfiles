;;; init-java.el -- Java related configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package java-ts-mode
  :ensure nil
  :hook ((java-ts-mode . eglot-ensure)))

(use-package java-mode
  :ensure nil
  :hook ((java-mode . eglot-ensure)))

(provide 'init-java)
;;; init-java.el ends here
