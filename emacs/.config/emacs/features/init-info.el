;;; init-info.el -- Configuration for info -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package info
  :ensure nil
  :hook ((Info-mode . scroll-lock-mode))
  :bind (("C-h i" . info)
         :map Info-mode-map
         ("M-[" . #'Info-history-back)
         ("M-]" . #'Info-history-forward)
         ("h" . #'Info-prev)
         ("j" . #'Info-next-reference)
         ("k" . #'Info-prev-reference)
         ("l". #'Info-next)
         ("/" . #'Info-search)
         ("B" . #'bookmark-set)))

(provide 'init-info)
;;; init-info.el ends here
