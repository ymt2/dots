;; Keybind

; beginning of indented line C-a
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

; Kill whole line C-k
(setq kill-whole-line t)

; Backward delete char C-h
(global-set-key "\C-h" 'backward-delete-char)

; Backward kill C-w
(defun backward-kill-word-or-kill-region ()
  (interactive)
  (if (or (not transient-mark-mode) (region-active-p))
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
(global-set-key "\C-w" 'backward-kill-word-or-kill-region)

; Replace M-rM-r
(define-prefix-command 'meta-r-prefix)
(global-set-key "\M-r" 'meta-r-prefix)
(global-set-key "\M-r\M-r" 'replace-string)
(global-set-key "\M-r\M-e" 'replace-regexp)

; dired / change-to-dired-mode
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

; other-window
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key [C-tab] 'other-window-or-split)
