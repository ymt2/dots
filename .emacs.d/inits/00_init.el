;; use Zsh
(setq shell-file-name "/bin/zsh")

;; switch Command-key and Option-key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; yes or no -> y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Newline
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; no beep
(defun my-bell-function ()
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                                keyboard-quit mwheel-scroll down up next-line previous-line
                                backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)
(setq visible-bell t)

;; Hippie expand
(global-set-key "\M-/" 'hippie-expand)
(setq hippie-expand-try-functins-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        ))

;; toggle-fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

;; move buffer
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;; ffap
(ffap-bindings)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; sha1-el.el
;; (install-elisp "http://stuff.mit.edu/afs/sipb/contrib/emacs/packages/flim-1.14.7/sha1-el.el")
(require 'sha1-el)

;; sql-beautify
;; http://dev.ariel-networks.com/Members/matsuyama/sql-beautifying-in-emacs/
(defun sql-beautify-region (start end)
  "Beautify SQL in region between START and END."
  (interactive "r")
  (save-excursion
    (shell-command-on-region start end "sqlbeautify" nil t)))

(defun sql-beautify-buffer ()
 "Beautify SQL in buffer."
 (interactive)
 (sql-beautify-region (point-min) (point-max)))

;; 行末のwhitespaceを削除
;; http://pokutuna.hatenablog.com/entry/20111117/1321523457
(setq delete-trailing-whitespace-exclude-patterns (list "\\.md$" "\\.markdown$"))
(require 'cl)
(defun delete-trailing-whitespace-with-exclude-pattern ()
  (interactive)
  (cond ((equal nil (loop for pattern in delete-trailing-whitespace-exclude-patterns
                          thereis (string-match pattern buffer-file-name)))
         (delete-trailing-whitespace))))
(add-hook 'before-save-hook 'delete-trailing-whitespace-with-exclude-pattern)

;; ファイル末尾の改行を削除
;; http://pokutuna.hatenablog.com/entry/20111117/1321523457
(defun my-delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))
(add-hook 'before-save-hook 'my-delete-trailing-blank-lines)
