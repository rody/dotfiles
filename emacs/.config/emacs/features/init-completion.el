;;; init-completion.el -- configuration for completions systems -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package emacs
  :ensure nil
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

(use-package orderless
  :ensure t
  :defer t
  :init
  (setq completion-styles '(orderless flex)
        completion-category-overrides '((eglot (styles . (orderless flex basic))))))

(use-package vertico
  :ensure t
  :defer t
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
  :init
  (vertico-mode)
  (vertico-multiform-mode))

(use-package vertico-directory
  :after vertico
  :defer t
  :ensure nil
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
  :init
  (setq vertico-multiform-commands
        '((consult-line (:not posframe))
          (t posframe)))
  (vertico-multiform-mode 1))

(use-package marginalia
  :ensure t
  :defer t
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init
  (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings)))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'init-completion)
;;; init-completion.el ends here
