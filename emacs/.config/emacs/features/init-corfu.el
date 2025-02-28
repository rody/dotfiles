;;; init-corfu.el -- configuration for corfu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package corfu
  :ensure t
  :hook ((after-init . global-corfu-mode)
         (corfu-mode . corfu-popupinfo-mode))
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-cycle t)
  (setq corfu-echo-documentation t)
  (setq corfu-scroll-margin 5)
  ;; Sort by input history (no need to modify `corfu-sort-function').
  ;;(with-eval-after-load 'savehist
  ;;(corfu-history-mode 1)
  ;;(add-to-list 'savehist-additional-variables 'corfu-history))
  )

(provide 'init-corfu)
;;; init-corfu.el ends here
