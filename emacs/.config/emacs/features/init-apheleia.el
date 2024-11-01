;;; init-apaeleia.el -- configuration for apheleia -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; APHELEIA
;; auto-format different source code files extremely intelligently
;; https://github.com/radian-software/apheleia

(use-package apheleia
  :ensure t
  :hook ((prog-mode . apheleia-mode)))

(provide 'init-apheleia)
;;; init-apheleia.el ends here
