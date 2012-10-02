;;; ddskk
;;; 
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)
(setq skk-jisyo-code 'utf-8-unix)
(setq mac-pass-control-to-system nil)

;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;;漢字登録時、送り仮名が厳密に正しいかをチェック
(setq skk-check-okurigana-on-touroku t)
