;;; init-org-re-reveal.el -- Configuration for org-re-reveal -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org-re-reveal
  :ensure t
  :after org
  :config
  (setq org-re-reveal-revealjs-version "4")
  (setq org-re-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js@4.6.1")
  (setq org-re-reveal-theme "black")
  ;; don't center slides by default
  ;; can be overriden in document with
  ;; #+OPTIONS: reveal_center:t
  (setq org-re-reveal-center nil)
  (setq org-re-reveal-transition 'none)
  (setq org-re-reveal-progress nil)
  (setq org-re-reveal-plugins '(chalkboard markdown notes zoom search highlight))
  (add-to-list 'org-re-reveal-plugin-config
               '(chalkboard "RevealChalkboard"
                            "https://cdn.jsdelivr.net/npm/reveal.js-plugins@4.2.5/chalkboard/plugin.js"
                            "https://cdn.jsdelivr.net/npm/reveal.js-plugins@4.2.5/chalkboard/style.css"
                            "https://cdn.jsdelivr.net/npm/reveal.js-plugins@4.2.5/menu/font-awesome/css/fontawesome.css"))
  ;; chalkboard depends on FontAwesome
  (setq org-re-reveal-extra-scripts '("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"))
  (setq org-re-reveal-extra-css "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css")
  (setq org-re-reveal-head-preamble "
<style>
  code {
    color: #9c88ff;
  }
</style>
")
  )


(provide 'init-org-re-reveal)
;;; init-org-re-reveal.el ends here
