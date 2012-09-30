;; Recent file history
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("^/[^/:]+:"))
;(setq recentf-exclude
;      '("PATH"))

;; Recentf-ext
(require 'recentf-ext)
(global-set-key [?\C-;] 'recentf-open-files)
