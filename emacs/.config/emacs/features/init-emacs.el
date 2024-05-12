;;; init-emacs.el -- emacs configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package emacs
  :ensure nil
  :custom
  (byte-compile-warnings nil)
  (use-short-answers t)
  (warning-minimum-level :error)
  (fill-column 100)

  :init
  ;; (setq-default mode-line-format
  ;;  (list
  ;;   ;; buffer modified status
  ;;   "%* "
  ;;   ;; buffer name
  ;;   (propertize "%b " 'face 'bold)
  ;;   "           "
  ;;   ;; vc-mode
  ;;   'vc-mode
  ;;   "           "
  ;;   ;; major mode
  ;;   "(" 'mode-name ")"
  ;;   ))
  )

(provide 'init-emacs)
;;; init-emacs.el ends here
