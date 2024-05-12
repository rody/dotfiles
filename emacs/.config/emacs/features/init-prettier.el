;;; init-prettier.el -- Prettier configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package prettier
  :ensure t
  :commands (prettier-prettify
             prettier-info
             prettier-mode
             prettier-restart
             prettier-prettify-region
             pretiier-prettify-org-src-code-at-point
             global-prettier-mode)
  :custom
  (prettier-mode-lighter ""))

(provide 'init-prettier)
;;; init-prettier.el ends here
