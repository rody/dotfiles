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
  (gptel-model "llama3.1:latest")
  :config
  (setq-default gptel-backend (gptel-make-ollama
                                  "Ollama"
                                :host "localhost:11434"
                                :models '("mistral:7b"
                                          "lama3.1:latest"
                                          "qwen2.5-coder:latest"
                                          "zephyr:latest")
                                :stream t)))

(provide 'init-gptel)
;;; init-gptel.el ends here
