;;; init-treesit.el -- configuration for tree-sitter -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package treesit
  :ensure nil
  ;; from https://nathanfurnal.xyz/posts/building-tree-sitter-langs-emacs/
  :defer t
  :commands (treesit-install-language-grammar rody-treesit-install-all-languages)
  ;; :init
  ;; (setq treesit-language-source-alist
  ;;       '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
  ;;         (c . ("https://github.com/tree-sitter/tree-sitter-c"))
  ;;         (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
  ;;         (css . ("https://github.com/tree-sitter/tree-sitter-css"))
  ;;         (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod"))
  ;;         (html . ("https://github.com/tree-sitter/tree-sitter-html"))
  ;;         (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
  ;;         (json . ("https://github.com/tree-sitter/tree-sitter-json"))
  ;;         (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
  ;;         (make . ("https://github.com/alemuller/tree-sitter-make"))
  ;;         (ocaml . ("https://github.com/tree-sitter/tree-sitter-ocaml" "ocaml/src" "ocaml"))
  ;;         (python . ("https://github.com/tree-sitter/tree-sitter-python"))
  ;;         (php . ("https://github.com/tree-sitter/tree-sitter-php"))
  ;;         (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "typescript/src" "typescript"))
  ;;         (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
  ;;         (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
  ;;         (sql . ("https://github.com/m-novikov/tree-sitter-sql"))
  ;;         (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))
  ;;         (zig . ("https://github.com/GrayJack/tree-sitter-zig"))))
  :config
  (defun rody-treesit-install-all-languages ()
    "Install all languages specified by `treesit-language-source-alist'."
    (interactive)
    (let ((languages (mapcar 'car treesit-language-source-alist)))
      (dolist (lang languages)
	(treesit-install-language-grammar lang)
	(message "`%s' parser was installed." lang)
	(sit-for 0.75)))))

(use-package treesit-fold
  :ensure t
  :hook ((go-ts-mode . treesit-fold-mode)
         (apex-ts-mode . treesit-fold-mode)
         (json-ts-mode . treesit-fold-mode)
         (zig-ts-mode . treesit-fold-mode))
  :bind (:map treesit-fold-mode-map
              ("<backtab>" . #'treesit-fold-toggle)))

(use-package treesit-fold-indicators
  :ensure nil
  :after treesit-fold
  :bind (("C-c t F" . treesit-fold-indicators-mode)))

(provide 'init-treesit)
;;; init-treesit.el ends here
