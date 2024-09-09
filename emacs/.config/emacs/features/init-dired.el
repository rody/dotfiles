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
  (delete-by-moving-to-trash t)
  (dired-listing-switches
   "-l --human-readable --group-directories-first --no-group"))

(use-package dired-x
  :ensure nil
  :after dired
  :config
  ;; Make dired-omit-mode hide all "dotfiles"
  ;; (setq dired-omit-files
  ;;     (concat dired-omit-files "\\|^\\..*$"))
  ;;:hook
  ;;(dired-mode . dired-omit-mode)
  )

(use-package dirvish
  :ensure t
  :defer t
  ;;:commands (dirvish)
  :ensure-system-package ((ffmpegthumbnailer . "brew install ffmpegthumbnailer")
                          (mediainfo . "brew install mediainfo"))
  :bind (("C-c t d" . dirvish-side)
         :map dirvish-mode-map
         ("a" . dirvish-quick-access)
         ("f" . dirvish-file-info-menu)
         ("y"   . dirvish-yank-menu)
         ("N"   . dirvish-narrow)
         ;; ("^"   . dirvish-history-last)
         ("h"   . dirvish-history-jump) ; remapped `describe-mode'
         ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
         ("v"   . dirvish-vc-menu)      ; remapped `dired-view-file'
         ("TAB" . dirvish-subtree-toggle)
         ("M-f" . dirvish-history-go-forward)
         ("M-b" . dirvish-history-go-backward)
         ("M-l" . dirvish-ls-switches-menu)
         ("M-m" . dirvish-mark-menu)
         ("M-t" . dirvish-layout-toggle)
         ("M-s" . dirvish-setup-menu)
         ("M-e" . dirvish-emerge-menu)
         ("M-j" . dirvish-fd-jump))
  :custom
  (dirvish-side-auto-close t)
  (dirvish-use-mode-line nil)
  (dirvish-attributes
   '(;vc-state
     ;subtree-state
     all-the-icons
     ;collapse
     file-time
     file-size))
  :init
  (dirvish-override-dired-mode)
  (dirvish-side-follow-mode +1) ; similar to `treemacs-follow-mode'
  )

(provide 'init-dired)
;;; init-dired.el ends here
