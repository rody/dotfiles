;;; init-rust.el -- Rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rust-ts-mode
  :ensure nil
  :mode ("\\.rs\\'" . rust-ts-mode)
  :hook (rust-ts-mode . eglot-ensure)i
  :config
  (with-eval-after-load 'compile
    (add-to-list 'compilation-error-regexp-alist 'cargo)
    (add-to-list 'compilation-error-regexp-alist-alist
                 '(cargo
                   "^\\(\\(error\\)\\|\\(warning\\)\\|\\(note\\)\\).*\n\\ *--> \\(.*?\\):\\([0-9]+\\):\\([0-9]+\\)$"
                        5 ;; file
                        6 ;; line
                        7 ;; column
                        (3 . 4)
                        ))))

(provide 'init-rust)
;;; init-rust.el ends here
