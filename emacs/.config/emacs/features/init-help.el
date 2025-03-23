;;; init-help.el -- Configuration for help -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package help
  :ensure nil
  :config
  (setq help-window-select 'always)
  (setq help-window-keep-selected t)
  (add-to-list 'display-buffer-alist
               '("*Help*"
                 (display-buffer-reuse-window display-buffer-in-side-window)
                 (side . right)
                 (window-width . 100))))


(use-package helpful
  :ensure t
  :bind  (("C-h f" . helpful-callable)
          ("C-h v" . helpful-variable)
          ("C-h k" . helpful-key))
  :config
  (setq helpful-switch-buffer-function #'pop-to-buffer))

(use-package tldr
  :ensure t
  :commands (tldr
             tldr-update-docs)
  :bind (("C-h t" . tldr)))

(use-package devdocs
  :ensure t
  :bind (("C-h D" . devdocs-lookup))
  :config
  (setq devdocs-data-dir (concat rody-emacs-data-directory "devdocs"))
  (add-to-list 'display-buffer-alist
               '("*devdocs*"
                 (display-buffer-reuse-window display-buffer-in-side-window)
                 (side . right)
                 (window-width . 100))))

(provide 'init-help)
;;; init-help.el ends here
