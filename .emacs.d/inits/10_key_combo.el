;; key-combo.el
;;
;; (auto-install-from-url "https://raw.github.com/uk-ar/key-combo/36cc9bc85868cea9c32b18031850b1f5d9633e31/key-combo.el")

(require 'key-combo)

(key-combo-mode 1)
(key-combo-define-global (kbd "=") '(" = " " == " " === " ))
(key-combo-define-global (kbd "=>") " => ")