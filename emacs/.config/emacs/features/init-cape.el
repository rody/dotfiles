;;; init-cape.el -- Configuration for cape -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package cape
  :ensure t
  :hook ((prog-mode . (lambda()
                        (add-to-list 'completion-at-point-functions #'cape-file)
                        (add-to-list 'completion-at-point-functions #'tempel-complete)))
         (eglot-managed-mode . (lambda()
                                 (setq-local completion-at-point-functions
                                             (list
                                              (cape-capf-super
                                               #'eglot-completion-at-point)))
                                 (add-to-list 'completion-at-point-functions #'cape-file))))
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p t" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p h" . cape-history)
         ("C-c p f" . cape-file)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-elisp-symbol)
         ("C-c p e" . cape-elisp-block)
         ("C-c p a" . cape-abbrev)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)
         ("C-c p :" . cape-emoji)
         ("C-c p \\" . cape-tex)
         ("C-c p _" . cape-tex)
         ("C-c p ^" . cape-tex)
         ("C-c p &" . cape-sgml)
         ("C-c p r" . cape-rfc1345))
  )

(provide 'init-cape)
;;; init-cape.el ends here
