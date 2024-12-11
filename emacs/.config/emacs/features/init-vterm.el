;;; init-vterm.el -- configuration related to vterm -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package vterm
  :after project
  :ensure t
  :commands (vterm
             vterm-other-window)
  :bind (("C-c t t" . vterm)
         :map project-prefix-map
         ("t" . project-vterm))
  :preface
  (defun project-vterm ()
    ;; from https://www.reddit.com/r/emacs/comments/wu5rxi/tramp_projectel_vterm_integration_help/
    (interactive)
    (defvar vterm-buffer-name)
    (let* ((default-directory (project-root     (project-current t)))
           (vterm-buffer-name (project-prefixed-buffer-name "vterm"))
           (vterm-buffer (get-buffer vterm-buffer-name)))
      (if (and vterm-buffer (not current-prefix-arg))
          (pop-to-buffer vterm-buffer  (bound-and-true-p display-comint-buffer-action))
        (vterm))))
  :custom
  (switch-to-buffer-obey-display-actions t)
  (vterm-always-compile-module t)
  (vterm-use-vterm-prompt-detection-method t)
  (vterm-copy-exclude-prompt t)
  (vterm-max-scrollback 100000)
  (vterm-tramp-shells '(("ssh" "/bin/bash")
                        ("podman" "/bin/bash")))
  :init
  (add-to-list 'project-switch-commands     '(project-vterm "Vterm") t)
  (add-to-list 'project-kill-buffer-conditions  '(major-mode . vterm-mode))

  (add-to-list 'display-buffer-alist
               '("vterm\\*"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . 0) ;; -1 == L  0 == Mid 1 == R
                 (window-height . 0.33) ;; take 2/3 on bottom left
                 (window-parameters
                  (no-delete-other-windows . nil)))))

(provide 'init-vterm)
;;; init-vterm.el ends here
