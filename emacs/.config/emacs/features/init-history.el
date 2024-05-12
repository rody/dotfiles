;;; init-history.el -- Configuration for history -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq history-length 20000)
(setq history-delete-duplicates t)

(use-package savehist
  :defer 10
  :custom
  (savehist-save-minibuffer-history t)
  (savehist-file (concat rody-emacs-state-directory "history"))
  :config
  (mapc (lambda (ring)
          (add-to-list 'savehist-additional-variables
                       ring))
        '(kill-ring
          search-ring
          regexp-search-ring
          last-kbd-macro
          shell-command-history
          log-edit-comment-ring))
  (savehist-mode +1))

(provide 'init-history)
;;; init-history.el ends here
