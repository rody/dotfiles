;;; init-tempel.el -- configuration for tempel -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package tempel
  :ensure t
  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))
  :preface
  (defun rody-open-template-file()
    "Open the tempel file for editing."
    (interactive)
    (find-file (concat user-emacs-directory "/templates")))
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-complete
                      completion-at-point-functions)))
  :hook ((conf-mode . tempel-setup-capf)
         (prog-mode . tempel-setup-capf)
         (text-mode . tempel-setup-capf)
         (eglot-managed-mode . tempel-setup-capf))
  :custom
   (tempel-trigger-prefix ">"))

(provide 'init-tempel)
;;; init-tempel.el ends here
