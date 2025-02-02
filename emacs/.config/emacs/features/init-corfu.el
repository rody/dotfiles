;;; init-corfu.el -- configuration for corfu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package corfu
  :ensure t
  :defer t
  :custom
  (corfu-popupinfo-delay 0.5)
  (corfu-preview-current nil)
  (corfu-cycle t)
  (corfu-echo-documentation t)
  (corfu-scroll-margin 5)
  :init
  (global-corfu-mode +1)
  (corfu-popupinfo-mode +1)
  )

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))


(provide 'init-corfu)
;;; init-corfu.el ends here
