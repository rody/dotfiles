;;; init-magit.el -- init-magit.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t
  :bind (("C-c g g" . magit-dispatch)))

(use-package forge
  :ensure t
  :after magit
  :hook
  ((magit-status-sections-hook . forge-insert-requested-reviews)
  (magit-status-sections . forge-insert-assigned-pullreqs)
  (magit-status-sections . forge-insert-authored-pullreqs)
  (magit-status-sections . forge-insert-assigned-issues)
  (magit-status-sections . forge-insert-authored-issues))
  :custom
  (forge-topic-list-limit '(2000 . -1))
  ;; from: https://blog.thomasheartman.com/posts/improve-your-workflow-with-forge
  (ghub-use-workaround-for-emacs-bug 'force))

(use-package git-timemachine
  :ensure t
  :bind (("C-c g t" . git-timemachine)))

(use-package magit-todos
  :ensure t
  :after magit
  :ensure-system-package (rg . ripgrep)
  :config
  (magit-todos-mode 1))

(provide 'init-magit)
;;; init-magit.el ends here
