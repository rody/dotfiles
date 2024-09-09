;;; init-features.el -- Configuration entry point -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "/features"))

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.0f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(defvar my/section-start-time (current-time) "Time when section was started.")

;; Only use rody--require-with-time with string literal paths.
(defun rody--require-with-time (library)
  (setq my/section-start-time (current-time))
  (require library)
  (message "%-36s section time: %.0f ms"
           library
           (* 1000 (float-time (time-subtract (current-time) my/section-start-time)))))


;; Need these loaded ASAP (many subsequent libraries depend on them).
(rody--require-with-time 'init-package-extensions)
(rody--require-with-time 'init-exec-path-from-shell)
(rody--require-with-time 'init-xdg)
(rody--require-with-time 'init-no-littering)
(rody--require-with-time 'init-mac)
(rody--require-with-time 'init-ui)

;; Load before remaining. Useful for debugging init.el issues.
(rody--require-with-time 'init-maintenance)

(rody--require-with-time 'init-emacs)
(rody--require-with-time 'init-server)
;; (rody--require-with-time 'init-nano)
(rody--require-with-time 'init-fontaine)
(rody--require-with-time 'init-image)
(rody--require-with-time 'init-files)
(rody--require-with-time 'init-history)
(rody--require-with-time 'init-recentf)
(rody--require-with-time 'init-buffers)
(rody--require-with-time 'init-editing)
(rody--require-with-time 'init-help)
(rody--require-with-time 'init-imenu)
(rody--require-with-time 'init-minibuffer)
(rody--require-with-time 'init-corfu)
(rody--require-with-time 'init-cape)
(rody--require-with-time 'init-consult)
(rody--require-with-time 'init-rg)
(rody--require-with-time 'init-completion)
(rody--require-with-time 'init-tempel)
(rody--require-with-time 'init-treesit)
(rody--require-with-time 'init-prog)
(rody--require-with-time 'init-project)
(rody--require-with-time 'init-perspective)
(rody--require-with-time 'init-hideshow)
(rody--require-with-time 'init-magit)
(rody--require-with-time 'init-vterm)
(rody--require-with-time 'init-denote)
(rody--require-with-time 'init-text-mode)
(rody--require-with-time 'init-nov)
(rody--require-with-time 'init-org-remark)
(rody--require-with-time 'init-elfeed)
(rody--require-with-time 'init-gptel)
(rody--require-with-time 'init-repeat)
(rody--require-with-time 'init-indent-bars)
(rody--require-with-time 'init-spelling)
(rody--require-with-time 'init-calc)
(rody--require-with-time 'init-dired)
(rody--require-with-time 'init-ace-window)
(rody--require-with-time 'init-avy)

;; Theme, colors...
(rody--require-with-time 'init-modus-theme)
(rody--require-with-time 'init-pulsar)

;; inputs
(rody--require-with-time 'init-meow)
(rody--require-with-time 'init-which-key)

;; checkers/prog helpers
(rody--require-with-time 'init-compile)
(rody--require-with-time 'init-eglot)
(rody--require-with-time 'init-dape)
(rody--require-with-time 'init-eldoc)
(rody--require-with-time 'init-flymake)
(rody--require-with-time 'init-apheleia)

;; languages
(rody--require-with-time 'init-org-mode)
(rody--require-with-time 'init-markdown)
(rody--require-with-time 'init-golang)
(rody--require-with-time 'init-html)
(rody--require-with-time 'init-csv)
(rody--require-with-time 'init-json)
(rody--require-with-time 'init-restclient)
(rody--require-with-time 'init-docker)
(rody--require-with-time 'init-ollama)
(rody--require-with-time 'init-java)
(rody--require-with-time 'init-terraform)
(rody--require-with-time 'init-javascript)
(rody--require-with-time 'init-typescript)
(rody--require-with-time 'init-salesforce)
(rody--require-with-time 'init-prettier)
(rody--require-with-time 'init-xml)
(rody--require-with-time 'init-yaml)
(rody--require-with-time 'init-jq)
(rody--require-with-time 'init-rust)
(rody--require-with-time 'init-zig)
(rody--require-with-time 'init-openscad)
;; (rody--require-with-time 'init-mermaid)
(rody--require-with-time 'init-plantuml)
(rody--require-with-time 'init-emmet)
(rody--require-with-time 'init-css)

;; misc
(rody--require-with-time 'init-icons)
(rody--require-with-time 'init-doom-modeline)
(rody--require-with-time 'init-doom-themes)
(rody--require-with-time 'init-emms)

(provide 'init-features)
;;; init-features.el ends here
