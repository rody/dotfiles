;;; init-markdown.el -- configuration for markdown mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md'" . markdown-mode))
  :custom
  (markdown-command "multimarkdown")
  (markdown-open-command #'rody-preview-current-buffer-in-quicklook)
  (markdown-asymmetric-header t)
  (markdown-header-scaling t)
  (markdown-marginalize-headers nil))

(provide 'init-markdown)
;;; init-markdown.el ends here
