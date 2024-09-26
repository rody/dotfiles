;;; init-zig.el -- Zig configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package zig-ts-mode
  :ensure t
  :vc (:url "https://github.com/ryleelyman/zig-ts-mode")
  :ensure-system-package ((zig . "brew install zig")
                          (zls . "brew install zls"))
  :mode (("\\.zig\\'" . zig-ts-mode))
  :init
  (with-eval-after-load 'treesit
    (add-to-list 'treesit-language-source-alist
                 '(zig "https://github.com/maxxnino/tree-sitter-zig")))
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
               '((zig-mode zig-ts-mode) "zls"))))

(provide 'init-zig)
;;; init-zig.el ends here
