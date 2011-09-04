;; load-path
(add-to-list 'load-path
	     "~/.emacs.d/plugins")
(add-to-list 'load-path
	     "~/.emacs.d/auto-install")

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install")
(auto-install-update-emacswiki-package-name t)
; for compatibility
(auto-install-compatibility-setup)

;; ddskk
(let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (normal-top-level-add-subdirs-to-load-path)))
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)
(setq skk-jisyo-code 'utf-8-unix)
(setq mac-pass-control-to-system nil)

;; UTF-8
(prefer-coding-system 'utf-8)

;; use Zsh
(setq shell-file-name "/bin/zsh")

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

;; face
(if window-system
    (progn
      (setq initial-frame-alist 
	    '(
	      (top . 0)
	      (left . 200)
	      (width . 90)
	      (height . 45)))
      (set-background-color "Black")
      (set-foreground-color "LightGray")
      (set-cursor-color "Gray")
      (set-frame-parameter nil 'alpha 95)))
(setq truncate-partial-width-windows nil)
(set-scroll-bar-mode nil)
; font
(set-face-attribute 'default nil
                    :family "monaco"
                    :height 130)
(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("ヒラギノ丸ゴ pro w4*" . "jisx0208.*"))
(set-fontset-font "fontset-default"
                  'katakana-jisx0201
                  '("ヒラギノ丸ゴ pro w4*" . "jisx0201.*"))
; hl linemode
(global-hl-line-mode)
; Inhibit SplashScreen
(setq inhibit-startup-message t)
; Visual feedback on selections
(setq-default transient-mark-mode t)
; Hide tool-bar
(tool-bar-mode nil)
; Highlight matching parenthesis
(when
    (fboundp 'show-paren-mode)
  (show-paren-mode t))
; Line, colum Number
;(require 'linum)
(line-number-mode t)
(column-number-mode t)
;(global-linum-mode t)
; C-x minibuffer
(iswitchb-mode t)
(iswitchb-default-keybindings)
(setq iswitchb-buffer-ignore
      '("*Completions*"))

;; Keybind
; C-a
(global-set-key "\C-a" 'beginning-of-indented-line)
(defun beginning-of-indented-line (current-point)
  (interactive "d")
  (if (string-match
       "^[ \t]+$"
       (save-excursion
         (buffer-substring-no-properties
          (progn (beginning-of-line) (point))
          current-point)))
      (beginning-of-line)
    (back-to-indentation)))
; C-k
(setq kill-whole-line t)
; C-h
(global-set-key "\C-h" 'backward-delete-char)

;; Tab settings
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; ffap
(ffap-bindings)

;; Recent file history
(setq recentf-max-saved-items 500)
;(setq recentf-exclude
;      '("PATH"))
(require 'recentf-ext)
(global-set-key [?\C-;] 'recentf-open-files)

;; sticky
(require 'sticky)
(use-sticky-key ";" sticky-alist:en)

;; yasnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; zen coding mode
(require 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(add-hook 'php-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap "\C-z" 'zencoding-expand-line)

;; magit
(add-to-list 'load-path
             "~/.emacs.d/plugins/magit")
(require 'magit)

;; weblogger
(require 'weblogger)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
