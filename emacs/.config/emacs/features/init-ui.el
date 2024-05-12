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
  (setq pixel-scroll-precision-use-momentum t)
  (pixel-scroll-precision-mode t))

;; Set font face height. Value is 1/10pt.
(set-face-attribute 'default nil
                    :height 140)

(use-package frame
  :ensure nil
  :defer 5
  :init
  ;; Mispressing C-z invokes `suspend-frame' (disable).
  (global-unset-key (kbd "C-z"))
  ;; Remove thin border. Visible since Monterey.
  (set-frame-parameter nil 'internal-border-width 0)
  (set-frame-position (selected-frame) 15 53)
  :custom
  ;; Enable expanding frame to end of screen.
  (frame-resize-pixelwise t))

(use-package window
  :ensure nil
  :defer t
  :custom
  ;; from https://www.masteringemacs.org/article/demystifying-emacs-window-manager
  (switch-to-buffer-obey-display-actions t)
  (window-resize-pixelwise t)
  ;; prefer split side-by-side
  (split-width-threshold 0)
  (split-height-threshold nil)
  (display-buffer-alist
   '(("\\*Async Shell Command\\*"
     (display-buffer-no-window)))))

(use-package winner
  :ensure nil
  :defer 5
  :init
  (winner-mode))

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

(use-package pulsar
  :ensure t
  :defer t
  :custom
  (pulsar-delay 0.055)
  (pulsar-iterations 10)
  (pulsar-face 'pulsar-yellow)
  (pulsar-highlight-face 'pulsar-yellow)
  :init
  ;; integration with the `consult' package:
  (add-hook 'consult-after-jump-hook #'pulsar-recenter-top)
  (add-hook 'consult-after-jump-hook #'pulsar-reveal-entry)

  ;; integration with the built-in `imenu':
  (add-hook 'imenu-after-jump-hook #'pulsar-recenter-top)
  (add-hook 'imenu-after-jump-hook #'pulsar-reveal-entry)
  (pulsar-global-mode +1))

(use-package svg-tag-mode
  :ensure t
  :hook ((org-mode . svg-tag-mode)
         (prog-mode . svg-tag-mode))
  :custom
  (svg-tag-tags
   '(("\\(TODO\\|todo\\)[[:blank:]\\:\n]+" . ((lambda (tag)
                   (svg-tag-make (upcase tag) :inverse t))))
     ("\\(FIXME\\|fixme\\)[[:blank:]\\:\n]+" . ((lambda (tag)
                                   (svg-tag-make (upcase tag) :inverse t :face 'error))))
     ("\\(DONE\\|done\\)[[:blank:]\\:\n]+" . ((lambda (tag)
                                   (svg-tag-make (upcase tag))))))))


(provide 'init-ui)
;;; init-ui.el ends here
