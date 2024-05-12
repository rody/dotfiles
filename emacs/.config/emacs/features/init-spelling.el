;;; init-spelling.el -- configuration for spelling related packages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package jinx
  ;; depends on libenchant (brew install enchant)
  :ensure t
  :bind (("C-c t j" . jinx-mode))
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jinx-languages)))

(provide 'init-spelling)
;;; init-spelling.el ends here
