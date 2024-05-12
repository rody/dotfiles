;;; init-ollama.el -- ollama related configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ellama
  :ensure t
  :commands (ellama-chat
             ellama-ask-about
             ellama-ask-selection
             ellama-ask-line
             ellama-complete
             ellama-translate
             ellama-define-word
             ellama-summarize
             ellama-code-review
             ellama-change
             ellama-make-list
             ellama-make-table
             ellama-summarize-webpage
             ellama-provider-select
             ellama-code-complete
             ellama-code-add
             ellama-code-edit
             ellama-code-improve
             ellama-improve-wording
             ellama-improve-grammar
             ellama-improve-conciseness
             ellama-make-format))

(provide 'init-ollama)
;;; init-ollama.el ends here
