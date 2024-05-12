;;; init-gptel.el -- gptel configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package gptel
  :ensure t
  :commands (gptel
             gptel-send
             gptel-menu)
  :custom
  (gptel-api-key (auth-source-pick-first-password :host "openai.com"))
  (gptel-default-mode 'org-mode)
  (gptel-model "llama2:latest")
  :config
  (setq-default gptel-backend (gptel-make-ollama
                               "Ollama"
                               :host "localhost:11434"
                               :models '("llama2:latest"
                                         "codellama:latest"
                                         "starcoder:latest")
                               :stream t)))

(provide 'init-gptel)
;;; init-gptel.el ends here
