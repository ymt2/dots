;;; zen coding mode
;;; (auto-install-from-url "https://github.com/rooney/zencoding/raw/master/zencoding-mode.el")
(require 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(add-hook 'php-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap "\C-z" 'zencoding-expand-line)
