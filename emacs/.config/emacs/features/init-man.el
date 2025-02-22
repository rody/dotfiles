;;; init-man.el -- Configuration for man -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package man
  :ensure nil
  :commands (man)
  :config
  (setq Man-notify-method 'aggressive))

(provide 'init-man)
;;; init-man.el ends here
