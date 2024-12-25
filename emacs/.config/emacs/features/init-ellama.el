;;; init-ellama.el -- Ellama configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ellama
  :ensure t
  :defer t
  :bind ("C-c e" . ellama-transient-main-menu)
  :config
  ;; setup key bindings
  ;; (setopt ellama-keymap-prefix "C-c e")
  ;; language you want ellama to translate to
  (setopt ellama-language "English")
  ;; could be llm-openai for example
  (require 'llm-ollama)
  (setopt ellama-provider
	  (make-llm-ollama
	   ;; this model should be pulled to use it
	   ;; value should be the same as you print in terminal during pull
	   :chat-model "zephyr:latest"
	   :embedding-model "zephyr:latest"
	   :default-chat-non-standard-params '(("num_ctx" . 8192))))
  ;; (setopt ellama-summarization-provider
  ;;         (make-llm-ollama
  ;;          :chat-model "qwen2.5:3b"
  ;;          :embedding-model "nomic-embed-text"
  ;;          :default-chat-non-standard-params '(("num_ctx" . 32768))))
  ;; Predefined llm providers for interactive switching.
  ;; You shouldn't add ollama providers here - it can be selected interactively
  ;; without it. It is just example.
  (setopt ellama-providers
          '(("zephyr" . (make-llm-ollama
        		 :chat-model "zephyr:latest"
        		 :embedding-model "zephyr:latest"))
            ("mistral" . (make-llm-ollama
        		  :chat-model "mistral:7b"
        		  :embedding-model "mistral:7b"))
            ("qwen-coder" . (make-llm-ollama
        		     :chat-model "qwen2.5-coder:latest"
        		     :embedding-model "qwen2.5-coder:latest "))))
  ;; Naming new sessions with llm
  ;; (setopt ellama-naming-provider
  ;;         (make-llm-ollama
  ;;          :chat-model "llama3:8b-instruct-q8_0"
  ;;          :embedding-model "nomic-embed-text"
  ;;          :default-chat-non-standard-params '(("stop" . ("\n")))))
  (setopt ellama-naming-scheme 'ellama-generate-name-by-llm)
  ;; Translation llm provider
  ;; (setopt ellama-translation-provider
  ;;         (make-llm-ollama
  ;;          :chat-model "qwen2.5:3b"
  ;;          :embedding-model "nomic-embed-text"
  ;;          :default-chat-non-standard-params
  ;;          '(("num_ctx" . 32768)))))
  )


(provide 'init-ellama)
;;; init-ellama.el ends here
