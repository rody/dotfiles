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
  :config
  ;; wait 5 seconds after I stop typing to run flymake
  (setq flymake-no-changes-timeout 5)
  (setq flymake-show-diagnostics-at-end-of-line nil) ;; other option: 'short
  (add-to-list 'display-buffer-alist
               '("\\*flymake diagnostics" (display-buffer-reuse-window display-buffer-in-side-window)
                 (side . bottom)
                 (slot . 1)
                 (window-height . 20))))

(use-package flymake-eslint
  :ensure t
  :after flymake
  ;; :hook ((tsx-ts-mode . flymake)
  ;;        (typescript-ts-mode . flymake)
  ;;        (javascript-mode . flymake))
  :config
  ;; If Emacs is compiled with JSON support
  (setq flymake-eslint-prefer-json-diagnostics t))


(provide 'init-flymake)
;;; init-flymake.el ends here
