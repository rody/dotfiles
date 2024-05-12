;;; init-csv.el -- CSV configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package csv-mode
  :ensure t
  :mode (("\\.csv\\'" . csv-mode)))

(provide 'init-csv)
;;; init-csv.el ends here
