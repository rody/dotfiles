;;; init-zig.el -- Zig configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package zig-mode
  :ensure t
  :ensure-system-package ((zig . "brew install zig")
                          (zls . "brew install zls"))
  :mode (("\\.zig\\'" . zig-mode))
  :hook ((zig-mode . eglot-ensure))
  :init
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '((zig-mode) "zls"))))

(provide 'init-zig)
;;; init-zig.el ends here
