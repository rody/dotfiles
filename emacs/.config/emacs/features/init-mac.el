;;; init-mac.el -- Mac specific configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(when (memq window-system '(mac ns))
  ;; No icon on window.
  (setq ns-use-proxy-icon nil)

  ;; Fixes mode line separator issues on macOS.
  (setq ns-use-srgb-colorspace nil)

  ;; Use existing frame when opening files.
  (setq ns-pop-up-frames nil)

  ;; Transparent titlebar on macOS.
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  ;; modifier commands
  (setq mac-command-modifier 'super)  ; command as super
  (setq mac-option-modifier 'meta)    ; option as meta
  (setq mac-control-modifier 'control); control as control
  (setq ns-function-modifier 'hyper)  ; Fn key as hyper

  ;; use macOS keychain
  (with-eval-after-load 'auth-source
    (add-to-list 'auth-sources 'macos-keychain-internet)
    (add-to-list 'auth-sources 'macos-keychain-generic))

  ;; Want menu bar on macOS.
  (use-package menu-bar
    :ensure nil
    :defer t
    :init
    (menu-bar-mode +1))
)

(provide 'init-mac)
;;; init-mac.el ends here
