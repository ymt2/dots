; autoinsert
(require 'autoinsert)
(auto-insert-mode t)
(setq auto-insert-directory "~/.emacs.d/share/template/")
(add-hook 'find-file-hooks 'auto-insert)

(defvar my:autoinsert-template-replace-alist
  '(("%file%" .
     (lambda()
       (file-name-nondirectory (buffer-file-name))))
    ("%author%" . (lambda()(identity user-full-name)))
    ("%email%"  . (lambda()(identity user-mail-address)))
    ("%filewithoutext%" .
     (lambda()
       (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
    ))
(defun my:template ()
  (time-stamp)
  (mapc #'(lambda(c)
            (progn
              (goto-char (point-min))
              (replace-string (car c) (funcall (cdr c)) nil)))
        my:autoinsert-template-replace-alist)
  (goto-char (point-max))
  (message "done."))

(setq auto-insert-alist
      (nconc '(
	       ("\\.rst$"  .["template.rst"  my:template])
               ) auto-insert-alist))
