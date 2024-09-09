;;; init-buffers.el -- Buffer configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'forward))

(use-package ibuffer
  :ensure nil
  :bind (:map ibuffer-mode-map)
  ("C-k" . ibuffer-do-delete))

(provide 'init-buffers)
;;; init-buffers.el ends here
