;;; init-fontaine.el -- fontaine configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package fontaine
  :ensure t
  :if window-system
  :init
  (setq fontaine-presets
   '((regular
      :default-family "Hack"
      :default-weight normal
      :default-height 150
      :fixed-pitch-family "Fira Code"
      :fixed-pitch-weight nil ; falls back to :default-weight
      :fixed-pitch-height 1.0
      :variable-pitch-family "Noto Sans"
      :variable-pitch-weight normal
      :variable-pitch-height 1.0
      :bold-family nil ; use whatever the underlying face has
      :bold-weight bold
      :italic-family "Source Code Pro"
      :italic-slant italic
      :line-spacing 1)
     (large
      :default-family "Iosevka"
      :default-weight normal
      :default-height 150
      :fixed-pitch-family nil ; falls back to :default-family
      :fixed-pitch-weight nil ; falls back to :default-weight
      :fixed-pitch-height 1.0
      :variable-pitch-family "FiraGO"
      :variable-pitch-weight normal
      :variable-pitch-height 1.05
      :bold-family nil ; use whatever the underlying face has
      :bold-weight bold
      :italic-family nil ; use whatever the underlying face has
      :italic-slant italic
      :line-spacing 1)
     (nano
      :default-family "Roboto Mono"
      :default-weight light
      :default-height 140
      :italic-family "Victor Mono"
      :italic-slant italic
      :italic-weight light
      :italic-height 160
      :bold-family "Roboto Mono" ; use whatever the underlying face has
      :bold-weight bold
      :line-spacing 0.2)
     (cascadia
      :default-family "MonaspiceNe Nerd Font Mono"
      :default-weight 300
      :default-height 140
      :variable-pitch-family "MonaspiceNe Nerd Font Propo"
      :variable-pitch-weight normal
      :variable-pitch-height 140
      :bold-family "MonaspiceNe Nerd Font Propo" ;
      :bold-weight bold
      :bold-height 140
      :italic-family "MonaspiceAr Nerd Font Mono"
      :italic-slant italic
      :italic-height 140
      :header-line-family "MonaspiceNe Nerd Font Mono"
      :line-spacing 0.1)
     (xl
      :default-family "MonaspiceNe Nerd Font Mono"
      :default-weight 300
      :default-height 220
      :variable-pitch-family "MonaspiceNe Nerd Font Propo"
      :variable-pitch-weight normal
      :variable-pitch-height 160
      :bold-family "MonaspiceNe Nerd Font Propo" ;
      :bold-weight bold
      :bold-height 220
      :italic-family "MonaspiceAr Nerd Font Mono"
      :italic-slant italic
      :italic-height 220
      :header-line-family "MonaspiceNe Nerd Font Mono"
      :line-spacing 0.1
)))

  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (fontaine-mode 1))


(provide 'init-fontaine)
;;; init-fontaine.el ends here
