;;; init-org-remark.el -- configuration for org-remark -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org-remark
  :ensure t
  :bind (;; :bind keyword also implicitly defers org-remark itself.
         ;; Keybindings before :map is set for global-map.
         ("C-c n m" . org-remark-mark)
         ("C-c n l" . org-remark-mark-line)
         :map org-remark-mode-map
         ("C-c n o" . org-remark-open)
         ("C-c n ]" . org-remark-view-next)
         ("C-c n [" . org-remark-view-prev)
         ("C-c n r" . org-remark-remove)
         ("C-c n d" . org-remark-delete))
  :config
  (org-remark-global-tracking-mode +1)
  ;; Optional if you would like to highlight websites via eww-mode
  (with-eval-after-load 'eww
    (org-remark-eww-mode +1))

  ;; Optional if you would like to highlight EPUB books via nov.el
  (with-eval-after-load 'nov
    (org-remark-nov-mode +1))

  ;; Optional if you would like to highlight Info documentation via Info-mode
  (with-eval-after-load 'info
    (org-remark-info-mode +1)))

(provide 'init-org-remark)
;;; init-org-remark.el ends here
