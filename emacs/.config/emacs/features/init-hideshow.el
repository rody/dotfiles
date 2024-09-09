;;; init-hideshow.el -- hideshow configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package hideshow
  :ensure nil
  :defer t
  :bind (("C-<tab>" . hs-toggle-hiding))
  :hook ((json-ts-mode . hs-minor-mode)))

(provide 'init-hideshow)
;;; init-hideshow.el ends here
