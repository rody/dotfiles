;;; init-docker.el -- docker related configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; taken from https://www.rahuljuliato.com/posts/emacs-docker-podman
(defcustom rody-docker-executable 'docker
  "The executable to be used with docker-mode."
  :type '(choice
	  (const :tag "docker" docker)
	  (const :tag "podman" podman))
  :group 'rody-emacs)

(use-package docker
  :ensure t
  :preface
  :commands (docker)
  :config
  (pcase rody-docker-executable
    ('docker
     (setf docker-command "docker"
	   docker-compose-command "docker-compose"
	   docker-container-tramp-method "docker"))
    ('podman
     (setf docker-command "podman"
	   docker-compose-command "podman-compose"
	   docker-container-tramp-method "podman"))))

(use-package dockerfile-mode
  :ensure t
  :ensure-system-package ((docker-langserver . "npm install -g dockerfile-language-server-nodejs@latest"))
  :mode (("Dockerfile" . dockerfile-mode)
         ("Containerfile'" . dockerfile-mode))
  :hook ((dockerfile-mode . eglot-ensure))
  :config
  (pcase rody-docker-executable
    ('docker
     (setq dockerfile-mode-command "docker"))
    ('podman
     (setq dockerfile-docker-command "podman")))
  ;; add lsp server to eglot
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(dockerfile-mode "docker-langserver" "--stdio"))))

(use-package docker-compose-mode
  :ensure t
  :ensure-system-package ((docker-compose-langserver . "npm install -g @microsoft/compose-language-service@latest"))
  :mode (("\\docker-compose.*\\.ya?ml\\'" . docker-compose-mode)
         ("\\compose.*\\.ya?ml\\'" . docker-compose-mode))
  :hook ((docker-compose-mode . eglot-ensure))
  :config
  ;; add lsp server to eglot
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(docker-compose-mode "docker-compose-langserver" "--stdio"))
    ))

(provide 'init-docker)
;;; init-docker.el ends here
