;;; init-help.el -- Configuration for help -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package help
  :ensure nil
  :defer t
  :custom
  (help-window-select t))

(use-package helpful
  :ensure t
  :bind  (("C-h f" . helpful-callable)
          ("C-h v" . helpful-variable)
          ("C-h k" . helpful-key))
   :custom
   (helpful-switch-buffer-function #'ar/helpful-switch-to-buffer)
   :init
   ;; from https://d12frosted.io/posts/2019-06-26-emacs-helpful.html
   (defun ar/helpful-switch-to-buffer (buffer-or-name)
     "Switch to helpful BUFFER-OR-NAME.

The logic is simple, if we are currently in the helpful buffer,
reuse it's window, otherwise create new one."
     (if (eq major-mode 'helpful-mode)
         (switch-to-buffer buffer-or-name)
       (pop-to-buffer buffer-or-name))))

(use-package tldr
  :ensure t
  :commands (tldr
             tldr-update-docs))

(use-package devdocs
  :ensure t
  :bind (("C-h D" . #'devdocs-lookup))
  :commands (devdocs-install
             devdocs-delete
             devdocs-update-all
             devdocs-lookup
             devdocs-peruse)
  :custom
  (devdocs-data-dir (concat rody-emacs-data-directory "devdocs")))

(provide 'init-help)
;;; init-help.el ends here
