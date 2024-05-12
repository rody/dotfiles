;;; init-modus-theme.el -- Configuration for modus theme-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package spacious-padding
  :ensure t
  :after frame
  :custom
  (spacious-padding-widths
   '( :internal-border-width 15
      :header-line-width 4
      :mode-line-width 4
      :tab-width 4
      :right-divider-width 30
      :scroll-bar-width 8))
  :config
  (spacious-padding-mode 1))

;; Modus Themes
(use-package modus-themes
  :ensure t
  ;:defer t
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  (modus-themes-mixed-fonts t)
  (modus-themes-headings '((1 . (1.5))
                           (2 . (1.3))
                           (t . (1.1))))
  (modus-themes-to-toggle
   '(modus-operandi-deuteranopia modus-vivendi-deuteranopia))
  :config
  (load-theme 'modus-operandi-deuteranopia t))

(provide 'init-modus-theme)
;;; init-modus-theme.el ends here
