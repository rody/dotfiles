;;; init-server.el -- server configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package server
  :ensure nil
  :defer t
  :config
  ;;(setq server-socket-dir "~/.local/share/emacs/server")
  (unless server-process
    (server-start)))

(provide 'init-server)
;;; init-server.el ends here
