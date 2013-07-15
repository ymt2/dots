;; css-mode
(require 'css-mode)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(setq cssm-indent-level 4)
(setq cssm-indent-function #'cssm-c-style-indenter)