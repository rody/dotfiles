;;; init-eaf.el -- EAF Emacs Application Framework configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package eaf
  :ensure t
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser) ;; unbind, see more in the Wiki

(require 'eaf-browser)
(require 'eaf-pdf-viewer)
)

(provide 'init-eaf)
;;; init-eaf.el ends here
