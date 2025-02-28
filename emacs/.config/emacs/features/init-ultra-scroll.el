;;; init-ultra-scroll.el -- Configuraton for ultra-scroll -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ultra-scroll
  :ensure t
  :vc (:url "https://github.com/jdtsmith/ultra-scroll")
  :init
  (setq scroll-conservatively 101) ;; important!
  (setq scroll-margin 0)
  :config
  (ultra-scroll-mode 1))

(provide 'init-ultra-scroll)
;;; init-ultra-scroll.el ends here
