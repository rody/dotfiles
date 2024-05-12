;;; init-docker.el -- docker related configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package docker
  :ensure t
  :commands (docker))

(use-package docker-compose-mode
  :mode (("\\docker-compose.ya?ml\\'" . docker-compose-mode))
  :ensure t)

(provide 'init-docker)
;;; init-docker.el ends here
