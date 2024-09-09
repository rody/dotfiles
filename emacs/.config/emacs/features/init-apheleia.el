;;; init-apaeleia.el -- configuration for apheleia -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; APHELEIA
;; auto-format different source code files extremely intelligently
;; https://github.com/radian-software/apheleia
(use-package apheleia
  :ensure t
  :hook ((jtsx-tsx-mode . apheleia-mode))
  :config
  (setf (alist-get 'prettier-json apheleia-formatters)
        '("prettier" "--stdin-filepath" filepath))
  (apheleia-global-mode +1))

(provide 'init-apheleia)
;;; init-apheleia.el ends here
