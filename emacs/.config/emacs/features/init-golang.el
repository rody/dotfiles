;;; init-golang.el -- configuration for golang -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package go-ts-mode
  :ensure nil
  :ensure-system-package ((go . "brew install golang")
                          (gopls . "go install golang.org/x/tools/gopls@latest")
                          (dlv . "go install github.com/go-delve/delve/cmd/dlv@latest")
                          (gofumpt . "go install mvdan.cc/gofumpt@latest"))
  :mode (("\\.go\\'" . go-ts-mode))
  :config
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(go "https://github.com/tree-sitter/tree-sitter-go"))))

(use-package go-mod-ts-mode
  :ensure nil
  :mode ("go.mod\\'" . go-mod-ts-mode))

;; (use-package flymake-golangci
;;   :ensure t
;;   :after flymake
;;   ;; :hook ((go-ts-mode . flymake-golangci-load)
;;   ;;        (go-mode . flymake-golangci-load))
;;   :hook (eglot-managed-mode . (lambda ()
;;                                 (when (derived-mode-p 'go-ts-mode)
;;                                   (flymake-golangci-load)
;;                                   )))
;;   )

(use-package templ-ts-mode
  :ensure t
  :ensure-system-package ((templ . "go install github.com/a-h/templ/cmd/templ@latest"))
  :mode (("\\.templ\\'" . templ-ts-mode))
  :init
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(templ "https://github.com/vrischmann/tree-sitter-templ")))
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(templ-ts-mode "templ" "lsp"))))

(use-package go-tag
  :ensure t
  :ensure-system-package ((gomodifytags . "go install github.com/fatih/gomodifytags@latest"))
  :after go-ts-mode
  :bind (:map go-ts-mode-map
              ("C-c c t" . go-tag-add)
              ("C-c c T" . go-tag-remove)))

(use-package ob-go
  ;; add support for go in org-mode
  :ensure t
  :commands (org-babel-execute:go
             org-babel-expand-body:go))

(provide 'init-golang)
;;; init-golang.el ends here
