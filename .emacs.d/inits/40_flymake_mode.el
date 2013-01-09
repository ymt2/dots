;;; flymake-mode
(require 'flymake)

(defun flymake-pep8-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "pep8" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
	     '("\\.py$" flymake-pep8-init))

(add-hook 'python-mode-hook
	  '(lambda ()
	     (flymake-mode t)))

;;; flymake-cursor
;;; (auto-install-from-emacswiki "flymake-cursor.el")
(require 'flymake-cursor)
