;; goto-chg
;; (auto-install-from-emacswiki "goto-chg.el")
(require 'goto-chg)
(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)
