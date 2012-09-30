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
