;;; init-icons.el -- Icons configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package all-the-icons
  :if (display-graphic-p)
  :ensure t
  :defer t
  )

(use-package all-the-icons-completion
  :if (display-graphic-p)
  :defer t
  :ensure t
  :init
  (all-the-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))

(use-package nerd-icons
  :if (display-graphic-p)
  :ensure t
  :defer t)

(provide 'init-icons)
;;; init-icons.el ends here
