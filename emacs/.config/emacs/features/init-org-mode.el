;;; init-org-mode.el -- Org mode configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org
  :ensure t
  :mode (("\\.org\\'" . org-mode))
  :hook ((org-babel-after-execute . org-redisplay-inline-images))
  :bind (("C-c a a" . org-agenda)
         ("C-c n c" . org-capture)
         ("M-n" . org-capture)
         :map org-mode-map
         ("C-c t o i" . org-toggle-inline-images)
         ("C-c t o l" . org-toggle-link-display)
         ("C-c t o p" . org-toggle-pretty-entities)
         ("C-c t o t" . org-toggle-tag))
  :custom
  (org-cycle-separator-lines -1) ;; keep empty lines when folding levels
  (org-startup-indented t)
  (org-directory "~/org")
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
  (org-todo-keywords
   '((sequence "TODO" "NEXT" "IN PROGRESS" "WAITING" "MAYBE" "|" "DONE" "CANCEL" "DELEGATED")))

  ;; org-agenda
  (org-agenda-files (directory-files-recursively org-directory "\\.org$"))
  (calendar-week-start-day 1) ;; week start on Monday
  (org-agenda-start-day "+0d")
  (org-agenda-span 3)
  (org-agenda-skip-timestamp-if-done t)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-include-deadlines t)
  (org-agenda-skip-scheduled-if-done t)
  ;;(org-agenda-block-separator nil)
  ;; from testing this seems to be a good value
  ;;(org-agenda-tags-column 100)
  ;;(org-agenda-compact-blocks nil)
  ;;(org-agenda-time-grid '((daily) () "" ""))
  (org-agenda-compact-blocks t)
  (org-agenda-start-with-log-mode t)
  ;; speed up options
  (org-agenda-inhibit-startup t)
  (org-agenda-dim-blocked-tasks nil)
  (org-agenda-use-tag-inheritance nil)
  (org-agenda-ignore-properties '(stats))

  ;; org capture
  (org-default-notes-file "~/org/todo.org")
  (org-capture-templates
   '(
      ;;;; other top-level templates
     ("t" "✔️ TODO" entry (file+headline org-default-notes-file "Tasks")
      "** TODO [#B] %^{Todo} %^G \n:PROPERTIES:\n:CREATED: %U\n:END:\n%?"
      :clock-in t :clock-resume t :empty-lines 1)
     ("n" "⏭️ Next Task" entry (file+headline org-default-notes-file "Tasks")
      "** NEXT [#A] %^{Todo} %^G \n:PROPERTIES:\n:CREATED: %U\nDEADLINE: %t\n:END:\n%?"
      :clock-in t :clock-resume t :empty-lines 1)
     ("i" "💡 Idea" entry (file+headline org-default-notes-file "Tasks")
      "** MAYBE %^{Title} %^G \n:PROPERTIES:\nCREATED: %U\n:END:\n%?"
      :clock-in t :clock-resume t :empty-lines 1)
     ("e" "🎫 Event/Meeting" entry (file+headline org-default-notes-file "Events")
      "** Event: %^{Event name}\n:PROPERTIES:\n:CREATED:%U\n:SCHEDULED: %^{time}t\n:END:\n %?"
      :clock-in t :clock-resume t :empty-lines 1)
     ("m" "🤝 Meeting Notes" entry (file+headline "meeting_notes.org" "Meeting Notes")
      "** Meeting Note: %^{Meeting name}\n:PROPERTIES:\n:CREATED:%U\n:END:\n %?"
      :clock-in t :clock-resume t :empty-lines 1)
     ("h" "🎯 Habit" entry (file+headline org-default-notes-file "Habits")
      "** NEXT %?\n%U\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
     ))
  )

(use-package org-agenda
  :ensure nil
  :after org
  :bind (("M-j". #'org-agenda-clock-goto)
         ("M-J" . #'bookmark-jump)))

(use-package org-super-agenda
  :ensure t
  :hook (org-agenda-mode . org-super-agenda-mode)
  :config
  (setq org-super-agenda-groups
        '(
          (:log t
                :order 1000)  ; Automatically named "Log"
          (:name "Next to do"
                 :todo "NEXT"
                 :order 0)
          (:name "Today"
                 :time-grid t
                 :scheduled today)
          (:habit t)
          (:name "Due today"
                 :deadline today)
          (:name "Overdue"
                 :deadline past)
          (:name "Due soon"
                 :deadline future)
          (:name "Important"
                 :priority "A")
          (:name "RACV Other"
                 :and (:tag "racv" :todo ("MAYBE"))
                 :order 11)
          (:name "RACV"
                 :tag "racv"
                 :order 10)
          (:name "Projects"
                 :children t)
          (:name "Family"
                 :tag "family"
                 :order 90)
          (:name "Guitar"
                 :tag "guitar"
                 :order 91)
          (:name "Unimportant"
                 :todo ("SOMEDAY" "MAYBE" "CHECK" "TO-READ" "TO-WATCH")
                 :order 100)
          (:name "Waiting..."
                 :todo "WAITING"
                 :order 98)
          (:name "Scheduled earlier"
                 :scheduled past)
          ))
  (setq org-super-agenda-keep-order t))

(use-package ob-emacs-lisp
  :ensure nil
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
   org-babel-expand-body:plantuml)
  :custom
  (org-plantuml-exec-mode 'plantuml))

(use-package ob-svgbob
  :ensure t
  :commands
  (org-babel-execute:svgbob))

(use-package ox-epub
  :after org
  :ensure t)

(use-package ox-latex
  :ensure nil
  :after org
  :config
  (setq org-latex-compiler "xelatex")
  (setq org-latex-src-block-backend 'listings)
  :config
  (use-package engrave-faces
    :ensure t))

(use-package ox-md
  :after org
  :ensure nil)

(use-package ox-clip
  :after org
  :ensure t)

(use-package ox-pandoc
  :after org
  :ensure t)

(use-package ox-typst
  :ensure t
  :after org)

(use-package org-modern
  :ensure t
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda))
  :config
  (setq org-modern-star 'replace))

(use-package org-appear
  :ensure t
  :hook (org-mode . org-appear-mode))

(use-package org-tidy
  :ensure t
  :hook (org-mode . org-tidy-mode))

;; long-table-edit support for org and markdown
(use-package lte
  :ensure t
  :hook ((org-mode . lte-truncate-table-mode)
         (markdown-mode . lte-truncate-table-mode)))

(provide 'init-org-mode)
;;; init-org-mode.el ends here
