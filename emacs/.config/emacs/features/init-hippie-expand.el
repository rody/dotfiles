;;; init-hippie-expand.el -- Configuration for hippie-expand -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package hippie-exp
  :ensure nil
  :init
  :bind ("M-/" . hippie-expand)
  :init
  (setq hippie-expand-try-functions-list
        '(try-expand-dabbrev
          try-expand-dabbrev-visible
          try-expand-dabbrev-all-buffers
          try-expand-dabbrev-from-kill
          try-complete-file-name-partially
          try-complete-file-name
          try-expand-all-abbrevs
          try-expand-list
          try-expand-line
          try-complete-lisp-symbol-partially
          try-complete-lisp-symbol)))

(provide 'init-hippie-expand)
;;; init-hippie-expand.el ends here
