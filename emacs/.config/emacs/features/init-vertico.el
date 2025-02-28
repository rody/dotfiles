;;; init-vertico.el -- configuration for vertico -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package vertico
  :ensure t
  :demand t
  :bind (:map vertico-map
              ("C-M-n" . vertico-next-group)
              ("C-M-p" . vertico-previous-group))
  :custom
  ;; Configure the display per command.
  ;; Use a buffer with indices for imenu
  ;; and a flat (Ido-like) menu for M-x.
  (vertico-multiform-commands
   '((consult-imenu buffer indexed)
     (helpful-callable buffer indexed)
     (consult-buffer buffer)))

  ;; Configure the display per completion category.
  ;; Use the grid display for files and a buffer
  ;; for the consult-grep commands.
  (vertico-multiform-categories
   '((consult-grep buffer)))
  :config
  (vertico-mode)
  (vertico-multiform-mode))

(use-package vertico-directory
  :ensure nil
  :after vertico
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

;; use posframe to display vertico completion
(use-package vertico-posframe
  :ensure t
  :after (vertico vertico-multiform)
  :config
  (setq vertico-multiform-commands
        '((consult-line (:not posframe))
          (t posframe)))
  (vertico-multiform-mode 1))

(provide 'init-vertico)
;;; init-vertico.el ends here
