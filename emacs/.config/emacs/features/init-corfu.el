;;; init-corfu.el -- configuration for corfu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package corfu
  :ensure t
  :demand t
  :bind (("C-<tab>" . #'completion-at-point)
         :map corfu-map
         ("SPC" . corfu-insert-separator)
         ("[tab]" . corfu-complete))
  :init
  (setq text-mode-ispell-word-completion nil)
  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (setq corfu-preview-current t)
  (setq corfu-min-width 20)
  (setq text-mode-ispell-word-completion nil)
  (setq read-extended-command-predicate #'command-completion-default-include-p)
  (setq corfu-cycle t)
  (setq corfu-echo-documentation t)
  (setq corfu-scroll-margin 5)
  (setq corfu-auto nil)
  ;; enable completion in minibuffer where vertico is not used
  (setq global-corfu-minibuffer t)
  (global-corfu-mode)
  (corfu-popupinfo-mode))

(provide 'init-corfu)
;;; init-corfu.el ends here
