;;; init-compile.el -- compile configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package compile
  :ensure nil
  :bind (("C-c c c" . compile)
         ("C-c c C" . recompile))
  :commands (compile recompile)
  :custom
  (compilation-scroll-output t)
  (compilation-ask-about-save t)
  :config
  (require 'ansi-color)
  (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
  (add-to-list 'display-buffer-alist
               '("\\*compilation\\*"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . 1) ;; -1 == L  0 == Mid 1 == R
                 (window-height . 0.33) ;; take 2/3 on bottom left
                 (window-parameters
                  (no-delete-other-windows . nil)))))

(provide 'init-compile)
;;; init-compile.el ends here
