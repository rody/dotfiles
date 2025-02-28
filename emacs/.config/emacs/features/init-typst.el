;;; init-typst.el -- Configuration for Typst -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package typst-ts-mode
  :ensure t
  :mode (("\\.typst\\'" . typst-ts-mode)
         ("\\.typ\\'" . typst-ts-mode))
  :hook ((typst-ts-mode . eglot-ensure)
         (typst-ts-mode . electric-pair-mode)
         (typst-ts-mode . apheleia-mode))
  :config
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(typst "https://github.com/uben0/tree-sitter-typst")))

  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs '(typst-ts-mode  "tinymist" "lsp")))

  (with-eval-after-load 'apheleia
    (setf (alist-get 'typstyle apheleia-formatters)
          '("typstyle"))
    (setf (alist-get 'typst-ts-mode apheleia-mode-alist)
          '(typstyle))))

(provide 'init-typst)
;;; init-typst.el ends here
