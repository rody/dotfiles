;;; init-xdg.el -- XDG configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'xdg)

(setq no-littering-etc-directory
      (expand-file-name "emacs/" (xdg-data-home)))
(setq no-littering-var-directory
      (expand-file-name "emacs/" (xdg-state-home)))

(setq rody-emacs-state-directory (file-name-as-directory
                                (concat
                                 (file-name-as-directory (xdg-state-home))
                                 "emacs")))

(setq rody-emacs-data-directory (file-name-as-directory
                               (concat
                                (file-name-as-directory (xdg-data-home))
                                "emacs")))

(provide 'init-xdg)
;;; init-xdg.el ends here
(xdg-state-home)
