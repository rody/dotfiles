;;; init-editing.el -- configuration for editing matters -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Prevent Extraneous Tabs.
;; From http://www.gnu.org/software/emacs/manual/html_node/eintr/Indent-Tabs-Mode.html
(setq-default indent-tabs-mode nil)

;; Show keystrokes earlier (ie. C-x)
(setq echo-keystrokes 0.1)
;; Overwrite selected text
(delete-selection-mode t)

;; scroll to top/bottom before signaling an error
(setq-default scroll-error-top-bottom t)

;; sentence ends with one space only
;; An old convention was to use 2 spaces after
;; a dot to distinguish the end of a sentence
;; from an abbreviation
(setq sentence-end-double-space nil)

(use-package whitespace
  :ensure nil
  :bind (("C-c t w" . whitespace-mode)))

(use-package visual-fill-column
  :ensure t
  :hook ((gfm-view-mode . visual-line-fill-column-mode)
         (gfm-mode . visual-line-fill-column-mode)
         (markdown-mode . visual-line-fill-column-mode)
         (org-mode . visual-line-fill-column-mode)))

(use-package autorevert
  :ensure nil
  :custom
  (global-auto-revert-non-file-buffers t)
  :init
  (global-auto-revert-mode +1))

(use-package vundo
  :ensure t
  :init
  (setq undo-limit 1000000)
  (setq undo-strong-limit (* 2 undo-limit))
  :commands (vundo))

(provide 'init-editing)
;;; init-editing.el ends here
