;;; init-eglot.el -- Eglot configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package eglot
  :ensure t
  :preface
  (defun rody-eglot-organize-imports ()
    (interactive)
    (eglot-code-actions nil nil "source.organizeImports" t))
  (defun rody--eglot-import-and-format-on-save()
    (eglot-ensure)
    (add-hook 'before-save-hook #'eglot-format-buffer nil t)
    (add-hook 'before-save-hook #'rody-eglot-organize-imports nil t))
  (defun rody--eglot-format-on-save()
    (eglot-ensure)
    (add-hook 'before-save-hook #'eglot-format-buffer nil t))
  :bind (:map
         eglot-mode-map
         ("C-c c a" . eglot-code-actions)
         ("C-c c o" . eglot-code-action-organize-imports)
         ("C-c c r" . eglot-rename)
         ("C-c c f" . eglot-format))
  :init
  (setq-default eglot-workspace-configuration
                '((:gopls .
                          ((staticcheck . t)
                           (gofumpt . t)
                           (analyses
                            (unreachable . t)
                            (unusedparams . t)
                            (unusedwrite . t)
                            (useany . t)
                            (unusedvariable . t)
                            (shadow . t))
                           ))))
  :hook ((go-ts-mode . rody--eglot-import-and-format-on-save)
         (rust-ts-mode . rody--eglot-format-on-save)
         (json-ts-mode . rody--eglot-format-on-save)
         (scad-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               '(terraform-mode . ("terraform-ls" "serve"))))

(use-package consult-eglot
  :ensure t
  :after (consult eglot))

(use-package consult-eglot-embark
  :ensure t
  :after (consult-eglot embark))

(provide 'init-eglot)
;;; init-eglot.el ends here
