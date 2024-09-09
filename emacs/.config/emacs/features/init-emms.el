;;; init-emms.el -- Configuration emms -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package emms
  :ensure t
  :commands (emms emms-browser)
  :config
  (require 'emms-setup)
  (emms-all)
  (emms-default-players)
  :custom
  (emms-source-file-default-directory (expand-file-name "/Volumes/music/Audio/"))
  )

(provide 'init-emms)
;;; init-emms.el ends here
