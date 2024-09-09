;;; init-ace-window.el -- ace-window configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ace-window
  :ensure t
  :defer t
  :bind (("C-x w w" . ace-window)
         ("M-o" . ace-window))
  :custom
  (aw-dispatch-always t)
  :custom-face
  (aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(provide 'init-ace-window)
;;; init-ace-window.el ends here
