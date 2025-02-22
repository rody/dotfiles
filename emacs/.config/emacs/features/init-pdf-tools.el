;;; init-pdf-tools.el -- Configuration for pdf-tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package pdf-tools
  :ensure t
  :defer t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (dolist
      (pkg
       '(pdf-annot pdf-cache pdf-dev pdf-history pdf-info pdf-isearch
                   pdf-links pdf-misc pdf-occur pdf-outline pdf-sync
                   pdf-util pdf-view pdf-virtual))
    (require pkg))
  (pdf-tools-install))

(provide 'init-pdf-tools)
;;; init-pdf-tools.el ends here
