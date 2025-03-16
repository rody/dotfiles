;;; init-mule.el -- Configuration for mule system -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package mule
  :ensure nil
  :config
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8))

(use-package mule-cmds
  :ensure nil
  :preface (provide 'mule-cmds)
  :config
  (set-language-environment 'UTF-8))

(provide 'init-mule)
;;; init-mule.el ends here
