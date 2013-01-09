;;; 30_rst_mode.el --- initial code

;; Copyright (C) 2012  Tatsuya Yamamoto

;; Author: Tatsuya Yamamoto <tatsuya@ymt2.net>
;; Keywords: rst-mode initial

;; (auto-install-from-url "http://docutils.sourceforge.net/tools/editors/emacs/rst.el")

(require 'rst)
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
		("\\.rest$" . rst-mode)) auto-mode-alist))
(setq frame-background-mode 'dark)
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))
