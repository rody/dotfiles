;;; init-flymake.el -- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flymake
  :ensure t
  :hook (prog-mode . flymake-mode)
  :bind (:map flymake-mode-map
              ("C-c ! n" . flymake-goto-next-error)
              ("C-c ! p" . flymake-goto-previous-error)
              ("C-c ! l" . flymake-show-buffer-diagnostics))
  :init
  (setq flymake-show-diagnostics-at-end-of-line t)
  (add-to-list 'display-buffer-alist
               '("\\*flymake diagnostics" (display-buffer-reuse-window display-buffer-in-side-window)
                 (side . bottom)
                 (slot . 1)
                 (window-height . 20))))

(provide 'init-flymake)
;;; init-flymake.el ends here