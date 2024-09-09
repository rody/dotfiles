;;; init-consult.el -- Configuration for consult-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package consult
  :ensure t
  :bind (;; C-x bindings (ctrl-x-map)
         ("C-x C-r" . consult-recent-file)
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-x t b" . consult-buffer-other-tab)
         ("C-x r b" . consult-bookmark)
         ("C-x p b" . consult-project-buffer)
         ("C-x M-:" . consult-complex-command)
          ;; Other custom bindings
         ("M-y" . consult-yank-pop)
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-fd)                  ;; Alternative: consult-find
         ("M-s f" . consult-fd)
         ("M-s c" . consult-locate)
         ("M-s g" . consult-ripgrep)             ;; Alternative: consult-grep
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element
  ;;:hook (completion-list-mode . consult-preview-at-point-mode)
  :custom
  (consult-narrow-key "<")
  (register-preview-function #'consult-register-format)
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;:preview-key '(:debounce 0.4 any) ;; Option 1: Delay preview
   :preview-key "M-.")            ;; Option 2: Manual preview
  )

(use-package consult-project-extra
  :ensure t
  :after consult
  :bind (("C-x p f" . consult-project-extra-find)
         ("C-x p F" . consult-project-extra-find-other-window)))

(use-package consult-dir
  :ensure t
  :after consult
  :bind (("C-x C-d" . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))

(use-package consult-git-log-grep
  :ensure t
  :after consult
  :commands (consult-git-log-grep)
  :config
  (with-eval-after-load 'magit
    (setq consult-git-log-grep-open-function #'magit-show-commit)))

(provide 'init-consult)
;;; init-consult.el ends here
