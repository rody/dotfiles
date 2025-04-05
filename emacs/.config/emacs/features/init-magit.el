;;; init-magit.el -- init-magit.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t
  :bind (("C-x g " . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-dispatch))
  :config
  (setq magit-save-repository-buffers 'dontask))

(use-package forge
  :ensure t
  :after magit
  :custom
  (forge-topic-list-limit '(2000 . -1))
  ;; from: https://blog.thomasheartman.com/posts/improve-your-workflow-with-forge
  (ghub-use-workaround-for-emacs-bug 'force))

(use-package forge-llm
  :ensure t
  :after (forge llm)
  :config
  (require 'llm-ollama)
  (setq forge-llm-llm-provider
        (make-llm-ollama :embedding-model "mistral:latest" :chat-model "mistral:latest" :default-chat-temperature 0.1))
  (forge-llm-setup))

(use-package git-timemachine
  :ensure t
  :bind (("C-c g t" . git-timemachine)))

(use-package magit-todos
  :ensure t
  :after magit
  :ensure-system-package (rg . "brew install ripgrep")
  :config
  (magit-todos-mode 1))

(provide 'init-magit)
;;; init-magit.el ends here
