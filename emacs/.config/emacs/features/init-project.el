;;; -*- lexical-binding: t; -*-

(use-package project
  :ensure nil
  :commands (project-dired
             project-shell
             project-eshell
             project-search
             project-vc-dir
             project-compile
             project-find-dir
             project-find-file
             project-find-regexp
             project-kill-buffers
             project-list-buffers
             project-shell-command
             project-display-buffer
             project-forget-project
             project-switch-project
             project-switch-to-buffer
             project-other-tab-command
             project-async-shell-command
             project-other-frame-command
             project-other-window-command
             project-query-replace-regexp
             project-forget-projects-under
             project-or-external-find-file
             project-forget-zombie-projects
             project-or-external-find-regexp
             project-remember-projects-under
             project-execute-extended-command
             project-display-buffer-other-frame)
  :custom
  (project-list-file (concat rody-emacs-state-directory "projects")))
