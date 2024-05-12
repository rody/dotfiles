;;; init-openscad.el -- Configuration related to openSCAD -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package scad-mode
  :disabled t
  :ensure t
  :ensure-system-package ((openscad-lsp . "cargo install openscad-lsp"))
  :mode ("\\.scad\\'" . scad-mode)
  :custom
  (scad-command "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD")
  :init
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(scad-mode . ("openscad-lsp")))))

(provide 'init-openscad)
;;; init-openscad.el ends here
