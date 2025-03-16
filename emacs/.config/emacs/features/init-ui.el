;;; init-ui.el -- ui related configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (display-graphic-p)
  ;; No title. See init.el for initial value.
  (setq-default frame-title-format nil)
  ;; Hide the cursor in inactive windows.
  (setq cursor-in-non-selected-windows nil)
  ;; Avoid native dialogs.
  (setq use-dialog-box nil)
  (setq-default line-spacing 0.3)

  ;; scrolling
  ;;(setq pixel-scroll-precision-use-momentum t)
  ;;(pixel-scroll-precision-mode t))
  )
;; Set font face height. Value is 1/10pt.
(set-face-attribute 'default nil
                    :height 140)


(use-package tool-bar
  :ensure nil
  :config
  (tool-bar-mode -1))

(use-package scroll-bar
  :ensure nil
  :config
  (scroll-bar-mode -1))

(use-package menu-bar
  :unless (eq window-system 'ns)
  :ensure nil
  :config
  (menu-bar-mode -1))


(use-package frame
  :ensure nil
  :init
  ;; Mispressing C-z invokes `suspend-frame' (disable).
  (global-unset-key (kbd "C-z"))
  ;; Remove thin border. Visible since Monterey.
  (set-frame-parameter nil 'internal-border-width 0)
  (set-frame-position (selected-frame) 15 53)
  :custom
  ;; Enable expanding frame to end of screen.
  (frame-resize-pixelwise t)
  ;; taken from perspective.el documentation: https://github.com/nex3/perspective-el
  ;; reuse window
  (display-buffer-base-action
   '((display-buffer-reuse-window display-buffer-same-window)
     (reusable-frames . t)))
  ;; avoid resizing
  (customize-set-variable 'even-window-sizes nil))

(use-package window
  :ensure nil
  :custom
  ;; from https://www.masteringemacs.org/article/demystifying-emacs-window-manager
  (switch-to-buffer-obey-display-actions t)
  (window-resize-pixelwise t)
  ;; prefer split side-by-side
  (split-width-threshold 0)
  (split-height-threshold nil)
  :init
  (add-to-list 'display-buffer-alist
               '("\\*Async Shell Command\\*"
                 (display-buffer-same-window)))
  ;; (add-to-list 'display-buffer-alist
  ;;              '("\\magit:"
  ;;                (display-buffer-same-window)))
  (add-to-list 'display-buffer-alist
               '("\\*Help"
                 (display-buffer-same-window)))
  (add-to-list 'display-buffer-alist
               '("\\*helpful"
                 (display-buffer-same-window))))

;; (use-package winner
;;   :ensure nil
;;   :defer t
;;   :init
;;   (winner-mode))

(use-package windmove
  :ensure nil
  :bind (("H-w j" . windmove-down)
         ("H-w k" . windmove-up)
         ("H-w h" . windmove-left)
         ("H-w l" . windmove-right)))

(use-package display-line-numbers
  :ensure nil
  :bind (("C-c t l" . display-line-numbers-mode)))

(use-package colorful-mode
  :ensure t
  :bind (("C-c t c" . colorful-mode)
         :map colorful-mode-map
         ("C-c c c" . nil)
         ("C-c c r" . nil)
         ("C-c c x" . nil)))

(provide 'init-ui)
;;; init-ui.el ends here
