;;; init-dired.el -- Dired configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dired
  :ensure nil
  :commands (dired)
  :custom
  ;; use next window on the same frame as the target for copy, rename, etc...
  (dired-dwim-target t)
  ;; use vc when renaming file
  (dired-vc-rename-file t)
  ;; ask about making backup before overwriting files
  (dired-backup-overwrite t)

  (dired-auto-revert-buffer #'dired-buffer-stale-p)
  (dired-create-destination-dir 'always)
  (delete-by-moving-to-trash t))

(use-package dired-x
  :after dired
  :config
  ;; Make dired-omit-mode hide all "dotfiles"
  (setq dired-omit-files
        (concat dired-omit-files "\\|^\\..*$"))
  :hook
  (dired-mode . dired-omit-mode))

(use-package dirvish
  :ensure t
  :after dired
  :ensure-system-package ((ffmpegthumbnailer . "brew install ffmpegthumbnailer")
                          (mediainfo . "brew install mediainfo"))
  :custom
  (dirvish-use-mode-line nil)
  :init
  (dirvish-override-dired-mode)
  :config
  (dirvish-side-follow-mode +1) ; similar to `treemacs-follow-mode'
  )


(provide 'init-dired)
;;; init-dired.el ends here
