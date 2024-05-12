;;; init-maintenance.el -- maintenance config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (< emacs-major-version 29)
  (use-package restart-emacs
    :ensure t
    :commands restart-emacs))

(provide 'init-maintenance)
;;; init-maintenance.el ends here
