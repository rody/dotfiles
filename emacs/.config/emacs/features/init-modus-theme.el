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
  :defer t
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  (modus-themes-mixed-fonts t)
  (modus-themes-fringes 'subtle)
  (modus-themes-region '(accented))
  (modus-themes-org-blocks 'gray-background)
  (modus-themes-completions '((matches . (extrabold))))
  (modus-themes-paren-match '(bold intense))
  (modus-themes-variable-pitch-ui t)
  (modus-themes-to-toggle
   '(modus-operandi-deuteranopia modus-vivendi-deuteranopia))
  ;; (modus-themes-headings
  ;;  '((1 . (variable-pitch 1.2))
  ;;    (2 . (1.2))
  ;;    (agenda-date . (1.3))
  ;;    (agenda-structure . (variable-pitch light 1.8))
  ;;    (t . (1.1))))
  :init
  (load-theme 'modus-vivendi-tinted t))

(provide 'init-modus-theme)
;;; init-modus-theme.el ends here
