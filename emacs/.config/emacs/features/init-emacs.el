;;; init-emacs.el -- emacs configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package emacs
  :ensure nil
  :demand t
  :bind (("M-u" . upcase-dwim)
         ("M-l" . downcase-dwim))
  :custom
  (tab-always-indent 'complete)
  (bookmark-save-flag 1)
  (byte-compile-warnings nil)
  (use-short-answers t)
  (warning-minimum-level :error)
  (fill-column 100)
  :init
  ;; unbind "dangerous/obsolete" key bindings
  (unbind-key "C-z") ;; suspend-frame
  (unbind-key "C-x C-z") ;; suspend-frame again
  (unbind-key "M-o") ;; facemenu-mode
  (unbind-key "<mouse-2>") ;; pasting with mouse-wheel click
  (unbind-key "<C-wheel-down>") ;; text scale adjust
  (unbind-key "<C-wheel-up>") ;; ditto
  (unbind-key "s-n") ;; make-frame
  (unbind-key "C-x C-q") ;; read-only-mode
  (unbind-key "s-t") ;; font selection
  )

(provide 'init-emacs)
;;; init-emacs.el ends here
