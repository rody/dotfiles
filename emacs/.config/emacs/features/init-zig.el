;;; init-zig.el -- Zig configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package zig-ts-mode
  :ensure t
  :ensure-system-package ((zig . "brew install zig")
                          (zls . "brew install zls"))
  :mode (("\\.zig\\'" . zig-ts-mode))
  :hook ((zig-ts-mode . eglot-ensure))
  :config
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(zig "https://github.com/maxxnino/tree-sitter-zig"))))

(provide 'init-zig)
;;; init-zig.el ends here
