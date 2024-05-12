;;; init-exec-path-from-shell.el -- shell path configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Ask shell for PATH, MANPATH, and exec-path and update Emacs environment.
;; We do this early on as we assert binaries are installed throughout
;; init.
(use-package exec-path-from-shell
  :ensure t
  :if (not (boundp 'ns-system-appearance))
  :custom
  (exec-path-from-shell-variables '("PATH" "MANPATH" "ZDOTDIR"))
  :config
  (exec-path-from-shell-initialize)
  (if (and (fboundp 'native-comp-available-p)
           (native-comp-available-p))
      (progn
	(message "Native comp is available")
        (when (eq system-type 'darwin)
          (customize-set-variable 'native-comp-driver-options '("-Wl,-w")))
        ;; Using Emacs.app/Contents/MacOS/bin since it was compiled with
        ;; ./configure --prefix="$PWD/nextstep/Emacs.app/Contents/MacOS"
        ;; Append to path to give priority to values from exec-path-from-shell-initialize.
        (add-to-list 'exec-path (concat invocation-directory (file-name-as-directory "bin")) t)
	(setenv "LIBRARY_PATH" (concat (getenv "LIBRARY_PATH")
                                       (when (getenv "LIBRARY_PATH")
                                         ":")
				       ;; This is where Homebrew puts libgccjit libraries.
                                       (car (file-expand-wildcards
                                             (expand-file-name "/opt/homebrew/opt/libgccjit/lib/gcc/*")))))
	;; Only set after LIBRARY_PATH can find gcc libraries.
	;;(setq comp-deferred-compilation t)
        ;;(setq comp-speed 3)
	)
    (message "Native comp is *not* available")))

(provide 'init-exec-path-from-shell)
;;; init-exec-path-from-shell.el ends here
