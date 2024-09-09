;;; init-elfeed.el -- configuration for Elfeed -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package elfeed
  :ensure t
  :commands (elfeed
             elfeed-update)
  :custom
  (elfeed-feeds
        '(("https://planet.emacslife.com/atom.xml" emacs)
          ("https://changelog.fm/rss" podcast)
          ("https://changelog.fm/gotime/feed" golang podcast)
          ("https://changelog.com/news/feed" podcast news)
          ("https://martinfowler.com/feed.atom" architecture)
          ("https://engineering.salesforce.com/feed/" salesforce)
          ("https://www.davidhaillant.com/feed/" electronics eurorack)
          ("http://pragmaticemacs.com/feed/" emacs)
          ("https://xenodium.com/rss.xml" emacs)
          ("https://cestlaz.github.io/rss.xml" emacs)
          ("https://blog.orhun.dev/rss.xml" zig)
          ("https://matklad.github.io/feed.xml" emacs)
          ("https://2019.wattenberger.com/rss" d3js dataviz)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCcCfJiovwYlhA_GmPTf4s_w" guitar woodworking)
          )))

(use-package elfeed-tube
  :ensure t
  :after elfeed
  :demand t
  :bind (:map elfeed-show-mode-map
              ("F" . elfeed-tube-fetch)
              ([remap save-buffer] . elfeed-tube-save)
              :map elfeed-search-mode-map
              ("F" . elfeed-tube-fetch)
              ([remap save-buffer] . elfeed-tube-save))
  :config
  (elfeed-tube-setup))

(use-package elfeed-tube-mpv
  :ensure t
  :after elfeed
  :demand t
  :bind (:map elfeed-show-mode-map
              ("C-c C-f" . elfeed-tube-mpv-follow-mode)
              ("C-c C-w" . elfeed-tube-mpv-where)))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
