;;; init.el ---

;; elpa
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (setq package-user-dir (concat user-emacs-directory "elpa"))
  (package-initialize))

;; auto-install
;; (package-install 'auto-install)

;; load-path
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; info
(require 'info)
(add-to-list 'Info-additional-directory-list "~/.emacs.d/info")

;; init-loader
;; (package-install 'init-loader)
(when (require 'init-loader nil t)
  (init-loader-load "~/.emacs.d/inits"))

;; auto byte compile
(add-hook 'after-save-hook
          (function (lambda ()
                      (if (eq major-mode 'emacs-lisp-mode)
                          (save-excursion
                            (byte-compile-file buffer-file-name))))))
