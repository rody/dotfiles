;;; init-eglot.el -- Eglot configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package eglot
  :ensure t
  :preface
  (defun rody-eglot-organize-imports ()
    (call-interactively 'eglot-code-action-organize-imports))
  (defun rody--eglot-import-and-format-on-save()
    (eglot-ensure)
    (add-hook 'before-save-hook #'eglot-format-buffer -10 t)
    (add-hook 'before-save-hook #'rody-eglot-organize-imports nil t))
  (defun rody--eglot-format-on-save()
    (eglot-ensure)
    (add-hook 'before-save-hook #'eglot-format-buffer nil t))
  :bind (:map
         eglot-mode-map
         ("C-c c l a" . eglot-code-actions)
         ("C-c c l o" . eglot-code-action-organize-imports)
         ("C-c c l r" . eglot-rename)
         ("C-c c l f" . eglot-format))
  :init
  (setq-default eglot-workspace-configuration
                '(:gopls (
                          :usePlaceholders t
                          :gofumpt t
                          :matcher "Fuzzy"
                          :analyses (
                                     :staticcheck t
                                     :unreachable t
                                     :unusedvariable t))
                         :yaml (
                                :format (
                                         :enable t)
                                :validate t
                                :hover t
                                :completion t
                                :schemaStore (:enable t)
                                :schemas (Kubernetes ["/**/*.yaml"]
                                                     ))))
  :hook ((go-ts-mode . rody--eglot-import-and-format-on-save)
         (rust-ts-mode . rody--eglot-format-on-save)
         (json-ts-mode . rody--eglot-format-on-save)
         (scad-mode . eglot-ensure)
         (templ-ts-mode . rody--eglot-format-on-save)
         (typescript-ts-mode . eglot-ensure)
         (css-ts-mode . eglot-ensure)
         (zig-ts-mode . rody--eglot-format-on-save)
         (yaml-mode . eglot-ensure)
         (yaml-ts-mode . eglot-ensure))

  :config
  (add-to-list 'eglot-server-programs
               '(terraform-mode "terraform-ls" "serve"))
  (add-to-list 'eglot-server-programs
               '((zig-mode) "zls"))
  (add-to-list 'eglot-server-programs
               '(templ-ts-mode "templ" "lsp")))

(use-package consult-eglot
  :ensure t
  :after (consult eglot))

(use-package consult-eglot-embark
  :ensure t
  :after (consult-eglot embark))

;; use tempel instead of yasnippet
;; (use-package eglot-tempel
;;   :hook (eglot-managed-mode . eglot-tempel-mode))

(provide 'init-eglot)
;;; init-eglot.el ends here
