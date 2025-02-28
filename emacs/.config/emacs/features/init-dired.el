;;; init-dired.el -- Dired configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dired
  :ensure nil
  :commands (dired)
  :hook ((dired-mode . dired-hide-details-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  ;; use next window on the same frame as the target for copy, rename, etc...
  (setq dired-dwim-target t)
  ;; use vc when renaming file
  (setq dired-vc-rename-file t)
  ;; ask about making backup before overwriting files
  (setq dired-backup-overwrite t)

  (setq dired-auto-revert-buffer t)
  (setq dired-create-destination-dir 'always)
  (setq dired-listing-switches
        "-l --human-readable --group-directories-first --no-group"))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind (:map dired-mode-map
              ("<tab>" . dired-subtree-toggle)
              ("TAB" . dired-subtree-toggle)
              ("<backtab>" . dired-subtree-remove)
              ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil)
  (setq dired-kill-when-opening-new-dired-buffer t))

(use-package dired-sidebar
  :ensure t
  ;;:after dired
  :bind (("C-c t f" . dired-sidebar-toggle-sidebar))
  :config
  (setq dired-sidebar-theme 'nerd-icons))

(provide 'init-dired)
;;; init-dired.el ends here
