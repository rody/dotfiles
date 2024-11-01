;;; init-ledger.el -- Ledger configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ledger-mode
  :ensure t
  :mode "\\.ledger\\'"
  :hook (ledger-mode . ledger-flymake-enable)
  :custom
  (ledger-clear-whole-transactions 1)
  (ledger-reports '(("bal this month" "%(binary) -f %(ledger-file) bal -p %(month) -S amount")
                    ("bal 2020"       "%(binary) -f %(ledger-file) bal -p 2020")
                    ("bal"            "%(binary) -f %(ledger-file) bal")
                    ("reg monthly"    "%(binary) -f %(ledger-file) reg -M")
                    ("reg"            "%(binary) -f %(ledger-file) reg")
                    ("accounts"       "%(binary) -f %(ledger-file) accounts")
                    ("account"        "%(binary) -f %(ledger-file) reg %(account)"))))

(provide 'init-ledger)
;;; init-ledger.el ends here
