;;; init.el ---

;; elpa
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (setq package-user-dir (concat user-emacs-directory "elpa"))
  (package-initialize))

;; load-path
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; auto-install
(cond ((require 'auto-install nil t)
       (setq auto-install-directory "~/.emacs.d/auto-install")
       (auto-install-update-emacswiki-package-name t)
       (auto-install-compatibility-setup)) ; for compatibility
      (package-install 'auto-install))

;; init-loader
(cond ((require 'init-loader nil t)
       (setq-default init-loader-byte-compile t)
					;(setq-default init-loader-show-log-after-init nil
					;init-loader-byte-compile t)
       (init-loader-load "~/.emacs.d/inits"))
      (package-install 'init-loader))

;; info
(when (require 'info nil t)
  (add-to-list 'Info-additional-directory-list "~/.emacs.d/info"))

;; auto byte compile
(add-hook 'after-save-hook
          (function (lambda ()
                      (if (eq major-mode 'emacs-lisp-mode)
                          (save-excursion
                            (byte-compile-file buffer-file-name))))))
