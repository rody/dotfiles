;;; init-files.el -- Configuration for files related packages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package files
  :ensure nil
  :custom
  ;; Automatically Kill Running Processes on Exit.
  ;; https://emacsredux.com/blog/2020/07/18/automatically-kill-running-processes-on-exit
  (confirm-kill-processes nil)
  ;; read-only buffers enable view-mode (C-x C-q enables editing).
  (view-read-only t)

  ;; disable auto save
  (setq auto-save-default nil)

  ;; Ensure files end with newline.
  (require-final-newline t)

  ;; Backups
  (backup-by-copying t)
  ;; allow multiple backup files, numbered.
  (version-control t)
  ;; cleanup old versions
  (delete-old-versions t)
  (kept-new-versions 6)
  (kept-old-versions 2)
  ;; make backup even for version controlled files
  (vc-make-backup-files t)

  ;; backup dir

  ;; don't create lockfiles
  (create-lockfiles nil)

  :init
  (let ((backup-directory (concat rody-emacs-state-directory "backup"))
        (save-files-directory (concat rody-emacs-state-directory "auto-save")))
    (unless (file-directory-p backup-directory)
      (make-directory backup-directory :parents))
    (setq backup-directory-alist
	  `((".*" . ,backup-directory)))
    (unless (file-directory-p save-files-directory)
      (make-directory save-files-directory :parents))
    (setq auto-save-file-name-transforms
          `((".*" ,save-files-directory t)))))

(provide 'init-files)
;;; init-files.el ends here
