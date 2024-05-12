;;; init-recentf.el -- recentf configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package recentf
  :ensure nil
  ;; :bind ("C-x C-r" . recentf-open-files)
  :hook (after-init . recentf-mode)
  :custom
    (recentf-max-menu-items 50)
    (recentf-max-saved-items 1000)
    (recentf-exclude '("/auto-install/"
                       ".recentf"
                       "/repos/"
                       "/elpa/"
                       "\\.mime-example"
                       "\\.ido.last"
                       "COMMIT_EDITMSG"
                       ".gz"
                       "~$"
                       "/ssh:"
                       "/sudo:"
                       "/scp:")))

(provide 'init-recentf)
;;; init-recentf.el ends here
