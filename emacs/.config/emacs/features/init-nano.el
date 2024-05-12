;;; init-nano.el -- configuration for nano emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package nano
  :ensure nil
  :no-require t
  :load-path "~/workspaces/emacs/nano-emacs"
  ;; uncoment for emacs 30+
  ;;:vc (:fetcher github :repo "rougier/nano-emacs")
  :init
  (defface bookmark-menu-heading
    `((((class color) (min-colors 89)) (:foreground "#000000")))
    "workaround")
  ;; for an unknown reason, `nano-layout' makes emacs crash
  ;; below is a copy of the relevant part which are know to work
  (setq default-frame-alist
      (append (list
	       '(min-height . 1)
               '(height     . 45)
	       '(min-width  . 1)
               '(width      . 81)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 24)
               '(left-fringe    . 1)
               '(right-fringe   . 1)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0))))
  ;; (require 'nano-layout)
  (require 'nano-colors)
  (require 'nano-faces)
  (require 'nano-modeline)
  (require 'nano-help)

  (require 'nano-theme)
  (require 'nano-theme-dark)
  (require 'nano-theme-light)
  (nano-theme-set-dark)
  (call-interactively 'nano-refresh-theme)
  (set-face 'cursor 'nano-face-tag-faded)
  (with-eval-after-load 'flymake
    (set-face 'flymake-error-echo-at-eol 'nano-face-faded)))

(use-package nano-writer
  :ensure nil
  :after org)

(provide 'init-nano)
;;; init-nano.el ends here
