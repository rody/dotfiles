;;; init-eldoc.el -- eldoc configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package eldoc
  :ensure nil
  :custom
  (eldoc-echo-area-prefer-doc-buffer t)
  (eldoc-echo-area-use-multiline-p nil))

(use-package eldoc-box
  :ensure t
  :bind (("C-h ." . eldoc-box-help-at-point)))

(provide 'init-eldoc)
;;; init-eldoc.el ends here
