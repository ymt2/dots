;;; emacs sever
;;;
(require 'server)
(unless (server-running-p)
  (server-start))
(defun iconify-emacs-when-server-is-done ()
  (unless server-clients (iconify-frame)))
(add-hook 'server-done-hook 'iconify-emacs-when-server-is-done)
(global-set-key (kbd "C-x C-c") 'server-edit)
(defalias 'exit 'save-buffers-kill-emacs)
