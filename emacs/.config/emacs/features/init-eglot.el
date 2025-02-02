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
         (scad-mode . eglot-ensure)
         (templ-ts-mode . rody--eglot-format-on-save)
         (typescript-ts-mode . eglot-ensure)
         (css-ts-mode . eglot-ensure)
         (zig-ts-mode . rody--eglot-format-on-save))
  :config
  ;; from
  ;; https://www.reddit.com/r/emacs/comments/1447fy2/looking_for_help_in_improving_typescript_eglot/
  ;; -- speed up?
  (declare-function jsonrpc--log-event "jsonrpc")
  (fset #'jsonrpc--log-event #'ignore)

  ;; from https://www.reddit.com/r/emacs/comments/1b25904/is_there_anything_i_can_do_to_make_eglots/
  (setq eglot-events-buffer-size 0)

  (add-to-list 'eglot-server-programs
               '(terraform-mode "terraform-ls" "serve"))
  (add-to-list 'eglot-server-programs
               '(templ-ts-mode "templ" "lsp")))

(use-package consult-eglot
  :ensure t
  :after (consult eglot))

(use-package consult-eglot-embark
  :ensure t
  :after (consult-eglot embark))

(provide 'init-eglot)
;;; init-eglot.el ends here
