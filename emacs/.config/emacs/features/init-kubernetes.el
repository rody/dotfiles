;;; init-kubernetes.el -- Kubernetes configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-poll-frequency 3600
        kubernetes-redraw-frequency 3600))

(provide 'init-kubernetes)
;;; init-kubernetes.el ends here
