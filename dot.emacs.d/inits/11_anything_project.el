;;; anything-project.el
;;; (auto-install-from-url "https://raw.github.com/imakado/anything-project/master/anything-project.el")

(require 'anything-project)
;(global-set-key (kbd "C-c C-f") 'anything-project)
(global-set-key (kbd "M-t") 'anything-project)

(ap:add-project
 :name 'wishscope
 :look-for '(".local")
 :include-regexp '("\\.php$" "\\.js$" "\\.css$" "\\.sql$" "\\.sh$")
  )
