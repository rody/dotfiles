;;; init-prog.el -- configuration for prog mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package prog-mode
  :ensure nil
  :hook (before-save . delete-trailing-whitespace)
  :bind (:map prog-mode-map
              ("C-x C-q" . view-mode)))

(use-package electric-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

(provide 'init-prog)
;;; init-prog.el ends here
