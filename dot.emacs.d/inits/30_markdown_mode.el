;;; markdown-mode.el
;;; (auto-install-from-url "http://jblevins.org/projects/markdown-mode/markdown-mode.el")
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
     (cons '("\\.md$" . markdown-mode) auto-mode-alist))
