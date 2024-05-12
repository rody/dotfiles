;;; init-calc.el -- emacs calc configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package casual
  :ensure t
  :defer t
  :after calc
  :bind (:map calc-mode-map
              ("?" . casual-main-menu)))

(provide 'init-calc)
;;; init-calculator.el ends here
