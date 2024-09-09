;;; init-org-mode.el -- Org mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org
  :ensure t
  :mode (("\\.org\\'" . org-mode))
  :hook ((org-babel-after-execute-hook . org-redisplay-inline-images))
  :bind (("C-c a a" . org-agenda)
         ("C-c n c" . org-capture)
         ("M-n" . org-capture)
         :map org-mode-map
         ("C-c t o i" . org-toggle-inline-image)
         ("C-c t o l" . org-toggle-link-display)
         ("C-c t o p" . org-toggle-pretty-entities))
  :preface
  (setq rody-org-todo-filename "~/org/TODO.org")
  (setq rody-org-project-note-filename "project.org")
  (setq rody-org-project-log-filename "log.org")
  (setq rody-org-project-notes-root "~/org/projects/")
  (setq rody-org-someday-filename "~/org/someday.org")
  (setq rody-org-distractions-filename "~/org/distractions.org")

  ;;;; idea from https://emacsconf.org/2023/talks/unentangling/ to manage notes for a project
  ;;;; outside of the project repo
  (defun rody-get-project-notes-dir()
    "Return the project notes directory if defined as a dir-local.
     Falls back to using the project name from project.el otherwise."
    (interactive)
    (if (bound-and-true-p rody-org-project-notes-dir)
        (concat rody-org-project-notes-root "/" rody-org-project-notes-dir "/")
      (if (bound-and-true-p project-vc-name)
          (concat rody-org-project-notes-root "/" project-vc-name "/")
        (error "No project name defined. Consider setting one in .dir-locals.el"))))

  (defun rody-get-project-note-filename()
    "Return the project note file."
    (concat (rody-get-project-notes-dir) rody-org-project-note-filename))

  (defun rody-get-project-note-file()
    "Return the project note file."
    (interactive)
    (find-file (rody-get-project-note-filename)))

  :custom
  (org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))
  (org-auto-align-tags nil)
  (org-tags-column 0)
  (org-catch-invisible-edits 'show-and-error)
  (org-special-ctrl-a/e t)
  (org-insert-heading-respect-content t)
  (org-return-follows-link t)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-ellipsis "…")
  (org-src-preserve-indentation t)
  (org-edit-src-content-indentation 5)
  (org-confirm-babel-evaluate nil)
  (org-use-sub-superscripts '{})
  (org-log-done 'time) ;; when a TODO is set to a done state, record a timestamp

  (org-capture-templates
   '(
     ;;;; Repo-specific templates
     ("p" "=== project-specific templates ===")
     ("pt" "✔️ New TODO (project-specific)" entry (file+headline (lambda () (rody-get-project-note-filename)) "Current project TODOs")
      "* TODO %?\n%U\n%a\n" :prepend t)
     ("pn" "📖 General note / assumptions / etc (project-specific)" entry (file+headline (lambda () (rody-get-project-note-filename)) "Notes")
      "* %?\n%U\n%a\n" :prepend t)
      ;;;; other top-level templates
     ("d" "⚽ A distraction!" entry (file rody-org-distractions-filename)
      "* %?\n Link: %a\n Captured: %U\n")
   ))

  :config
  ;; TODO see https://blog.d46.us/advanced-emacs-startup/ to make the language load faster
  (setq org-plantuml-exec-mode 'plantuml))

(use-package ob-emacs-lisp
  :ensure nil
  :defer t
  :commands
  (org-babel-execute:elisp
   org-babel-expand-body:elisp

   org-babel-execute:emacs-lisp
   org-babel-expand-body:emacs-lisp))

(use-package ob-shell
  :ensure nil
  :commands
  (org-babel-execute:sh
   org-babel-expand-body:sh

   org-babel-execute:bash
   org-babel-expand-body:bash))

(use-package ob-plantuml
  :ensure nil
  :commands
  (org-babel-execute:plantuml
   org-babel-expand-body:plantuml))

(use-package ox-epub
  :ensure t)

(use-package ox-latex
  :ensure nil
  :custom
  (org-latex-compiler "xelatex")
  (org-latex-src-block-backend 'listings)
  :config
  (use-package engrave-faces
    :ensure t))

(use-package ox-md
  :ensure nil)

(use-package ox-clip
  :ensure t)

(use-package ox-pandoc
  :ensure t
  :after org)

(use-package org-modern
  :ensure t
  :disabled t
  :after org
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

(use-package org-appear
  :ensure t
  :after org
  :hook (org-mode . org-appear-mode))

(use-package org-tidy
  :ensure t
  :after org)

(provide 'init-org-mode)
;;; init-org-mode.el ends here
