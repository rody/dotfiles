;;; init-css.el -- CSS configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package css-ts-mode
  :ensure nil
  :ensure-system-package (vscode-css-language-server)
  :hook ((css-ts-mode . eglot-ensure))
  :mode (("\\.css\\'" . css-ts-mode)))

(provide 'init-css)
;;; init-css.el ends here
