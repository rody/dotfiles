;;; init-marginalia.el -- Configuration for marginalia -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode)
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle)))

(provide 'init-marginalia)
;;; init-marginalia.el ends here
