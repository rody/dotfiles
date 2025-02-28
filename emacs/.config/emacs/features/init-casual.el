;;; init-casual.el -- emacs calc configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package casual
  :ensure t
  :defer 10)

(use-package casual-isearch
  :ensure nil
  :after casual
  :after isearch
  :defer t
  :bind(:map isearch-mode-map
             ("C-o" . #'casual-isearch-tmenu)
             ))

(use-package casual-agenda
  :ensure nil
  :after casual
  :after org-agenda
  :defer t
  :bind (:map org-agenda-mode-map
              ("C-o" . #'casual-agenda-tmenu)))

(use-package casual-ibuffer
  :ensure nil
  :defer t
  :after casual
  :after ibuffer
  :bind (:map ibuffer-mode-map
              ("C-o" . casual-ibuffer-tmenu)
              ("F" . #'casual-ibuffer-filter-tmenu)
              ("s" . #'casual-ibuffer-sortby-tmenu)))

(use-package casual-bookmarks
  :ensure nil
  :defer t
  :after casual
  :after bookmark
  :bind (:map bookmark-bmenu-mode-map
              ("C-o" . #'casual-bookmarks-tmenu)))

(use-package casual-calc
  :ensure nil
  :defer t
  :after casual
  :after calc
  :bind (:map calc-mode-map
              ("C-o" . #'casual-calc-tmenu)
              :map calc-alg-map
              ("C-o" . #'casual-calc-tmenu)))
(use-package casual-calendar
  :ensure nil
  :after casual
  :after calendar
  :bind (:map calendar-mode-map
              ("C-o" . #'casual-calendar-tmenu)))

(use-package casual-dired
  :ensure nil
  :defer t
  :after casual
  :after dired
  :bind (:map dired-mode-map
              ("C-o" . #'casual-dired-tmenu)
              ("s" . #'casual-dired-sort-by-tmenu)
              ("/" . #'casual-dired-search-replace-tmenu)))

(use-package casual-editkit
  :ensure nil
  :after casual
  :defer t
  :bind (("C-o" . #'casual-editkit-main-tmenu)))

(use-package casual-image
  :ensure nil
  :defer t
  :after casual
  :after image
  :bind (:map image-mode-map
              ("C-o" . #'casual-image-tmenu)))

(use-package casual-info
  :ensure nil
  :defer t
  :after casual
  :after info
  :bind ((:map Info-mode-map
               ("C-o" . #'casual-info-tmenu)
               ("p" . #'casual-info-browse-backward-paragraph)
               ("n" . #'casual-info-browse-forward-paragraph))))

(use-package casual-re-builder
  :ensure nil
  :defer t
  :after casual
  :after re-builder
  :bind (:map reb-mode-map
              ("C-o" . #'casual-re-builder-tmenu)
              :map reb-lisp-mode-map
              ("C-o" . #'casual-re-builder-tmenu)))







(provide 'init-casual)
;;; init-casual.el ends here
