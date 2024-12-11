;;; init-olivetti.el -- Configuration for olivetti mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package olivetti
  :ensure t
  :hook ((org-mode . olivetti-mode)))

(provide 'init-olivetti)
;;; init-olivetti.el ends here
