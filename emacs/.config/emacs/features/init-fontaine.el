;;; init-fontaine.el -- fontaine configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package fontaine
  :ensure t
  :if window-system
  :config
  (setq fontaine-presets
        '((font-rody
           :default-family "MonaspiceNe Nerd Font Mono"
           :default-weight regular
           :default-slant normal
           :default-width normal
           :default-height 120

           :fixed-pitch-family nil
           :fixed-pitch-weight nil
           :fixed-pitch-slant nil
           :fixed-pitch-width nil
           :fixed-pitch-height 1.0

           :fixed-pitch-serif-family nil
           :fixed-pitch-serif-weight nil
           :fixed-pitch-serif-slant nil
           :fixed-pitch-serif-width nil
           :fixed-pitch-serif-height 1.0

           :variable-pitch-family "MonaspiceRn Nerd Font Mono"
           :variable-pitch-weight nil
           :variable-pitch-slant nil
           :variable-pitch-width nil
           :variable-pitch-height 1.0

           :mode-line-active-family nil
           :mode-line-active-weight nil
           :mode-line-active-slant nil
           :mode-line-active-width nil
           :mode-line-active-height 1.0

           :mode-line-inactive-family nil
           :mode-line-inactive-weight nil
           :mode-line-inactive-slant nil
           :mode-line-inactive-width nil
           :mode-line-inactive-height 1.0

           :header-line-family nil
           :header-line-weight nil
           :header-line-slant nil
           :header-line-width nil
           :header-line-height 1.0

           :line-number-family nil
           :line-number-weight nil
           :line-number-slant nil
           :line-number-width nil
           :line-number-height 1.0

           :tab-line-family nil
           :tab-line-weight nil
           :tab-line-slant nil
           :tab-line-width nil
           :tab-line-height 1.0

           :bold-family nil
           :bold-slant nil
           :bold-weight bold
           :bold-width nil
           :bold-height 1.0

           :italic-family nil
           :italic-weight nil
           :italic-slant italic
           :italic-width nil
           :italic-height 1.0

           :line-spacing nil)
          (font-cascadia
           :default-family "Cascadia Code"
           :default-weight regular
           :default-slant normal
           :default-width normal
           :default-height 140

           :fixed-pitch-family nil
           :fixed-pitch-weight nil
           :fixed-pitch-slant nil
           :fixed-pitch-width nil
           :fixed-pitch-height 1.0

           :fixed-pitch-serif-family nil
           :fixed-pitch-serif-weight nil
           :fixed-pitch-serif-slant nil
           :fixed-pitch-serif-width nil
           :fixed-pitch-serif-height 1.0

           :variable-pitch-family "Cascadia Code"
           :variable-pitch-weight nil
           :variable-pitch-slant nil
           :variable-pitch-width nil
           :variable-pitch-height 1.0

           :mode-line-active-family nil
           :mode-line-active-weight nil
           :mode-line-active-slant nil
           :mode-line-active-width nil
           :mode-line-active-height 1.0

           :mode-line-inactive-family nil
           :mode-line-inactive-weight nil
           :mode-line-inactive-slant nil
           :mode-line-inactive-width nil
           :mode-line-inactive-height 1.0

           :header-line-family nil
           :header-line-weight nil
           :header-line-slant nil
           :header-line-width nil
           :header-line-height 1.0

           :line-number-family nil
           :line-number-weight nil
           :line-number-slant nil
           :line-number-width nil
           :line-number-height 1.0

           :tab-line-family nil
           :tab-line-weight nil
           :tab-line-slant nil
           :tab-line-width nil
           :tab-line-height 1.0

           :bold-family nil
           :bold-slant nil
           :bold-weight bold
           :bold-width nil
           :bold-height 1.0

           :italic-family nil
           :italic-weight nil
           :italic-slant italic
           :italic-width nil
           :italic-height 1.0

           :line-spacing nil)

          ;; alternate fonts
          (font-maple
           :default-family "Maple Mono NF"
           :variable-pitch-family "Maple Mono NF")
          (font-iosevka-comfy
           :default-family "Iosevka Comfy"
           :variable-pitch-family "Iosevka Comfy")
          (font-iosevka-comfy-duo
           :default-family "Iosevka Comfy Duo")
          (font-iosevka-fixed
           :default-family "Iosevka Fixed SS03")
          (font-fira-code
           :default-family "FiraCode Nerd Font Mono"
           :variable-pitch-family "FiraCode Nerd Font Propo")
          (font-victor-mono
           :default-family "VictorMono Nerd Font Mono"
           :variable-pitch-family "VictorMono Nerd Font Mono"
           :default-weight medium
           :default-slant normal
           :default-width normal
           :default-height 140)
          (font-jetbrains-mono
           :default-family "JetbrainsMono Nerd Font"
           :variable-pitch-family "JetbrainsMono Nerd Font Propo"
           :default-weight medium
           :default-slant normal
           :default-width normal
           :default-height 140)
          (font-sf-mono
           :default-family "SF Mono"
           :variable-pitch-family "SF Mono"
           :default-weight medium
           :default-slant normal
           :default-width normal
           :default-height 140)
          (font-hack
           :default-family "Hack Nerd Font"
           :variable-pitch-family "Hack Nerd Font"
           :default-weight medium
           :default-slant normal
           :default-width normal
           :default-height 160)
          (font-ibm-plex
           :default-family "IBM Plex Mono"
           :variable-pitch-family "IBM Plex Serif"
           :default-weight medium
           :default-slant normal
           :default-width normal
           :default-height 140)

          ;; font sizes
          (size-xs
           :default-height 100)
          (size-small
           :default-height 110)
          (size-normal
           :default-height 120)
          (size-large
           :default-height 150)
          (size-xl
           :default-height 180)
          (size-xxl
           :default-height 240)

          ;; line spacing
          (spacing-normal
           :line-spacing nil)
          (spacing-large
           :line-spacing 0.1)
          (spacing-xl
           :line-spacing 0.2)
          (spacing-xxl
           :line-spacing 0.3)
          ))

  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'font-rody))
  (fontaine-mode 1))


(provide 'init-fontaine)
;;; init-fontaine.el ends here
