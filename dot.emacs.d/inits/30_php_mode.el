;; php-mode
;; http://sourceforge.net/projects/php-mode/

(require 'php-mode)
(setq php-mode-force-pear t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

; php-lint
(defun php-lint ()
  "Perform a PHP lint-check on the current file."
  (interactive)
  (shell-command (concat "/usr/bin/php -l " (buffer-file-name))))

;; php-mode-hook
(add-hook 'php-mode-hook
          (lambda ()
	    (c-set-offset 'case-label' 4)
	    (c-set-offset 'arglist-intro' 4)
	    (c-set-offset 'arglist-cont-noempty' 4)
	    (c-set-offset 'arglist-close' 0)
	    (setq tab-width 2)
	    (setq indent-tabs-mode t)
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
            (define-key php-mode-map (kbd "C-c C-l") 'php-lint)
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))
