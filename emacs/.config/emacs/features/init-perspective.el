;;; init-perspective.el -- perspective.el configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package perspective
  :ensure t
  :defer t
  :hook (kill-emacs . persp-state-save)
  :bind (("C-x b" .   persp-switch-to-buffer*)
         ("C-x k" .   persp-kill-buffer*))
  :custom
  (persp-mode-prefix-key (kbd "C-z"))  ; pick your own prefix key here
  (persp-state-default-file (concat rody-emacs-state-directory "perspective-save"))
  :config
  (persp-mode))

(provide 'init-perspective)
;;; init-perspective.el ends here
