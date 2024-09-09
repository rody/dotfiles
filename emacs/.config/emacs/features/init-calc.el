;;; init-calc.el -- emacs calc configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package casual-calc
  :ensure t
  :defer t
  :after calc
  :bind (:map calc-mode-map
              ("?" . casual-main-menu)))

(provide 'init-calc)
;;; init-calc.el ends here
