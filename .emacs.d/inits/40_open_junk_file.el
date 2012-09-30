;; open_junk_file
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y/%m/%d-%H%M%S.md")
(global-set-key (kbd "C-x j") 'open-junk-file)
