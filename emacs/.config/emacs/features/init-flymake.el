;;; init-flymake.el -- flymake configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flymake
  :ensure t
;;  :pin melpa
  :hook (prog-mode . flymake-mode)
  :bind (:map flymake-mode-map
              ("C-c ! n" . flymake-goto-next-error)
              ("C-c ! p" . flymake-goto-previous-error)
              ("C-c ! l" . flymake-show-buffer-diagnostics))
  :custom
  ;; wait 5 seconds after I stop typing to run flymake
  (flymake-no-changes-timeout 5)
  ;; (flymake-indicator-type 'margins)
  ;; (flymake-margin-indicators-string
  ;;  `((error ,(nerd-icons-faicon "nf-fa-remove_sign")); compilation-error)
  ;;    (warning ,(nerd-icons-faicon "nf-fa-warning")); compilation-warning)
  ;;    (note ,(nerd-icons-faicon "nf-fa-circle_info")))); compilation-info)))
  (flymake-show-diagnostics-at-end-of-line nil) ;; other option: 'short

  :init
  (add-to-list 'display-buffer-alist
               '("\\*flymake diagnostics" (display-buffer-reuse-window display-buffer-in-side-window)
                 (side . bottom)
                 (slot . 1)
                 (window-height . 20))))

(provide 'init-flymake)
;;; init-flymake.el ends here
