;;; init-buffers.el -- Buffer configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ibuffer
  :ensure nil
  :hook ((ibuffer-mode . hl-line-mode)
         (ibuffer-mode . ibuffer-auto-mode))
  :bind (("C-x C-b" . #'ibuffer)
         :map ibuffer-mode-map
         ("{" . #'ibuffer-backwards-next-marked)
         ("}" . #'ibuffer-forward-next-marked)
         ("[" . #'ibuffer-backward-filter-group)
         ("]" . #'ibuffer-forward-filter-group)
         ("$" . #'ibuffer-toggle-filter-group)))

(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'forward))


(provide 'init-buffers)
;;; init-buffers.el ends here
