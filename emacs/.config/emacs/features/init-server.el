;;; init-server.el -- server configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package server
  :ensure nil
  :defer t
  :config
  (unless server-process
    (server-start)))

(provide 'init-server)
;;; init-server.el ends here
