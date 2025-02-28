;;; init-embark.el -- Configuration for emabark -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h B" . embark-bindings)))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'init-embark)
;;; init-embark.el ends here
