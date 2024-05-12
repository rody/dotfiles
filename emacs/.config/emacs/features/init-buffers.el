;;; init-buffers.el -- Buffer configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package uniquify
  :custom
  (uniquify-buffer-name-style 'forward))

;;; -*- lexical-binding: t; -*-

(use-package ibuffer
  :bind (:map ibuffer-mode-map)
  ("C-k" . ibuffer-do-delete))

(provide 'init-buffers)
;;; init-buffers.el ends here
