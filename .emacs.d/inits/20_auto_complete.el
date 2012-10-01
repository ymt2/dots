;;; auto-complete
;;; (auto-install-batch "auto-complete development version")
;(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
