;; open_junk_file
; (auto-install-from-emacswiki "open-junk-file.el")
(require 'open-junk-file)
;;(setq open-junk-file-format "~/junk/%Y/%m/%d-%H%M%S.md")
(setq open-junk-file-format "~/Dropbox/junk/%Y/%m/%d-%H%M%S.rst")
(global-set-key (kbd "C-x j") 'open-junk-file)
