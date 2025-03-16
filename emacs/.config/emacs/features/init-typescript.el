;;; init-typescript.el -- typescript configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package typescript-ts-mode
  :ensure nil
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . typescript-ts-mode))
  :custom
  (typescript-indent-level 2)
  :init
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(typescript "https://github.com/tree-sitter/tree-sitter-typescript"
                              "v0.20.3" "typescript/src")))
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(tsx "https://github.com/tree-sitter/tree-sitter-typescript"
                       "v0.20.3" "tsx/src")))
  )




;; (use-package jtsx
;;   :ensure t
;;   :mode (("\\.tsx\\'" . jtsx-tsx-mode)
;;          ("\\.ts\\'" . jtsx-typescript-mode)
;;          ("\\.jsx?\\'" . jtsx-jsx-mode))
;;   :hook ((jtsx-jsx-mode . hs-minor-mode)
;;          (jtsx-tsx-mode . hs-minor-mode)
;;          (jtsx-typescript-mode . hs-minor-mode)
;;          (jtsx-typescript-mode . eglot-ensure)
;;          (jtsx-jsx-mode . eglot-ensure)
;;          (jtsx-tsx-mode . eglot-ensure))
;;   :config
;;   (with-eval-after-load 'treesit
;;     (add-to-list 'treesit-language-source-alist '(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))
;;   (with-eval-after-load 'treesit
;;     (add-to-list 'treesit-language-source-alist '(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))

  ;;;; Setup Deno as the language server
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                '((js-mode typescript-mode jtsx-typescript-mode jtsx-tsx-mode jtsx-jsx-mode) . (eglot-deno "deno" "lsp")))

;;   (defclass eglot-deno (eglot-lsp-server) ()
;;     :documentation "A custom class for deno lsp.")

;;   (cl-defmethod eglot-initialization-options ((server eglot-deno))
;;     "Passes through required deno initialization options"
;;     (list :enable t
;;           :lint t)))
)


(provide 'init-typescript)
;;; init-typescript.el ends here
