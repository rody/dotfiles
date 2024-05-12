;;; init-restclient.el -- configuration for restclient -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package restclient
  :ensure t
  :mode (("\\.http\\'" . restclient-mode)))

(use-package restclient-jq
  :ensure t
  :after restclient)

(use-package ob-restclient
  :ensure t
  :after (org-mode))

(provide 'init-restclient)
;;; init-restclient.el ends here
