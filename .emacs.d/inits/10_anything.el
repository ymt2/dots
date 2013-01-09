;; anything
(require 'anything-startup)

(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "M-g M-.") 'anything-c-etags-selct)

(setq kill-ring-max 30)
(setq anything-kill-ring-threshold 5)
(global-set-key "\M-y" 'anything-show-kill-ring)

;; anything-migemo.el
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/anything-migemo.el")
(require 'anything-migemo)
