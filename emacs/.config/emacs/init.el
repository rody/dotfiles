;;; init.el --- This is my init.    -*- lexical-binding: t; -*-

;;; Commentary:
;; There is where my Emacs config starts.


;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init.el gc values (faster loading) ;;;;
;; (setq gc-cons-threshold (* 384 1024 1024)
;;      gc-cons-percentage 0.6)

;; Default was too low.
;; Increase for better lsp performance.
(setq read-process-output-max (* 3 1024 1024)) ;; 3mb

;; Default of 800 was too low.
;; Avoid Lisp nesting exceeding in swift-mode.
(setq max-lisp-eval-depth 10000)

;; https://github.com/hlissner/doom-emacs/blob/58af4aef56469f3f495129b4e7d947553f420fca/core/core.el#L184
(setq auto-mode-case-fold nil)

(setq initial-major-mode 'fundamental-mode)

;; https://github.com/hlissner/doom-emacs/blob/58af4aef56469f3f495129b4e7d947553f420fca/core/core.el#L358
(unless (daemonp)
  (advice-add #'tty-run-terminal-initialization :override #'ignore)
  (add-hook 'window-setup-hook
            (defun doom-init-tty-h ()
              (advice-remove #'tty-run-terminal-initialization #'ignore)
              (tty-run-terminal-initialization (selected-frame) nil t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Set up tls ;;;;

;; From https://irreal.org/blog/?p=8243
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; From https://github.com/hlissner/doom-emacs/blob/5dacbb7cb1c6ac246a9ccd15e6c4290def67757c/core/core-packages.el#L102
(setq gnutls-verify-error (not (getenv "INSECURE")) ; you shouldn't use this
      tls-checktrust gnutls-verify-error
      tls-program (list "gnutls-cli --x509cafile %t -p %p %h"
                        ;; compatibility fallbacks
                        "gnutls-cli -p %p %h"
                        "openssl s_client -connect %h:%p -no_ssl2 -no_ssl3 -ign_eof"))


;; ;;;; Custom file
;; ;; Save custom vars to separate file from init.el.
;; (setq custom-file (concat user-emacs-directory "custom.el"))
;; (when (file-exists-p custom-file)
;;   (load custom-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setup package

;; set the package dirs

(require 'package)
;; (setq-default package-user-dir "~/.local/share/emacs/elpa")

;; Don't auto-initialize.
(setq package-enable-at-startup nil)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(setq package-archive-priorities
      '(("melpa" .  4)
        ("melpa-stable" . 3)
        ("nongnu" . 2)
        ("gnu" . 1)))

(when (< emacs-major-version 27)
  (unless package--initialized
    (package-initialize)))

(when (< emacs-major-version 29)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)))

;; use-package-enable-imenu-support must be
;; set before requiring use-package.
;; (setq use-package-enable-imenu-support t)
;; (setq use-package-verbose t)
;; (setq use-package-compute-statistics t)
(use-package use-package
  :custom
  (use-package-always-ensure t)
  (package-native-compile t)
  (package-install-upgrade-built-in t)
  (warning-minimum-level :emergency))

;; Load non-core features.
(load "~/.config/emacs/features/init-features.el" nil t)

(provide 'init)
;;; init.el ends here
