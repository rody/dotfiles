;;; init-doom-themes.el -- Doom themes configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
  :ensure t
  :disabled t
  :init
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t
        doom-themes-padded-modeline t) ; if nil, italics is universally disabled
  :config
  (load-theme 'doom-palenight t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  )

(provide 'init-doom-themes)
;;; init-doom-themes.el ends here
