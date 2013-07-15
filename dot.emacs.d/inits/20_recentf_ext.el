;; Recent file history
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("^/[^/:]+:"))
;(setq recentf-exclude
;      '("PATH"))

;; Recentf-ext
;; (auto-install-from-emacswiki "recentf-ext.el")
(require 'recentf-ext)
(global-set-key (kbd "C-;") 'recentf-open-files)
