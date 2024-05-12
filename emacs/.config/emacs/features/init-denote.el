;;; init-denote.el -- Configuration for denote -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package denote
  :ensure t
  :hook ((dired-mode . denote-dired-mode-in-directories))
  :bind (("C-c n n" . denote-open-or-create)
         ("C-c n r" . denote-rename-file-using-front-matter)
         ("C-c n R" . denote-rename-file)
         ("C-c n k" . denote-keywords-add)
         ("C-c n k" . denote-keywords-remove)
         ("C-c n i" . denote-link-or-create)
         ("C-c n l" . denote-find-link)
         ("C-c n b" . denote-find-backlink)
         ("C-c n D" . denote-orgdb-block-insert-links))
  :custom
  (denote-directory "~/Documents/denote")
  :config
  (require 'denote-org-dblock))

(use-package consult-notes
  :ensure t
  :bind
    (("C-c w f" . consult-notes)
     ("C-c w s" . consult-notes-search-in-all-notes))
  :config
  (consult-notes-denote-mode))

(use-package denote-explore
  :ensure t
  :after denote
  :commands (denote-explore-count-notes
             denote-explore-count-keywords
             denote-explore-random-note
             denote-explore-random-link
             denote-explore-random-keyword
             denote-explore-identify-duplicate-identifiers
             denote-explore-single-keywords
             denote-explore-zero-keywords
             denote-explore-rename-keyword
             denote-explore-sort-keywords
             denote-explore-keywords-barchart
             denote-explore-extensions-barchart
             denote-explore-network-r
             denote-explore-network-save-json
             denote-explore-json-vertices-filename
             denote-explore-json-edges-filename))

(provide 'init-denote)
;;; init-denote.el ends here
