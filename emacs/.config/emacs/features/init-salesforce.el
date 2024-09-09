;;; init-salesforce.el -- configuration related to Salesforce -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package apex-ts-mode
  :ensure nil
  :load-path "~/workspaces/emacs/apex-ts-mode"
  :preface
  (defun rody-sf-generate-apex-class(name dir)
    "Generate an apex class."
    (interactive "sClass name: \nDDirectory: \n")
    (shell-command (combine-and-quote-strings `("sf" "apex" "generate" "class" "--output-dir" ,dir "--name" ,name)) "*sf output*" "*sf errors*")
    (find-file (concat dir "/" name ".cls"))
    (apex-ts-mode))

  (defun rody-sf-open-org(name-or-alias)
    "Opens a salesforce org"
    (interactive "sOrg name or alias: \n")
    (shell-command (combine-and-quote-strings `("sf" "org" "open" "--browser" "chrome" "-o" ,name-or-alias)) "*sf output*" "*sf errors*"))

  :mode (("\\.cls\\'" . apex-ts-mode)
         ("\\.trigger\\'" . apex-ts-mode)
         ("\\.apex\\'" . apex-ts-mode))
  :config
    (with-eval-after-load 'treesit
      (add-to-list 'treesit-language-source-alist
                   '(apex . ("https://github.com/aheber/tree-sitter-sfapex" "main" "apex/src")))))

(use-package eglot-apex
  :ensure nil
  :load-path "~/workspaces/emacs/eglot-apex"
  :hook
  ((apex-ts-mode . rody-eglot-apex-hook)
   (apex-ts-mode . eglot-apex-mode))
  :config
  (defun rody-eglot-apex-hook()
    (require 'eglot)
    (setq-local eglot-stay-out-of '(imenu))))

(use-package flymake-pmd
  :ensure nil
  :load-path "~/workspaces/emacs/flymake-pmd"
  :hook (apex-ts-mode . flymake-pmd-enable)
  :custom
  ;; name of the PMD executable (defaults to 'pmd')
  ;; you can also provide a full path if pmd is not in the exec-path
  ; (flymake-pmd-executable-name "~/Downloads/pmd-bin-6.55.0/bin/run.sh")
  ; (flymake-pmd-use-pmd-6 t)
  ; (flymake-pmd-pmd-6-app-name "pmd")
  (flymake-pmd-executable-name "~/Downloads/pmd-bin-7.5.0/bin/pmd")
  (flymake-pmd-use-pmd-6 nil)
  (flymake-pmd-use-eglot t))

(provide 'init-salesforce)
;;; init-salesforce.el ends here
