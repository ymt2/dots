;; init.el

; load-path
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(add-to-list 'load-path "~/.emacs.d/auto-install")

; info
(require 'info)
(add-to-list 'Info-additional-directory-list "~/.emacs.d/info")

; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
