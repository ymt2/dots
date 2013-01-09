;;; ddskk
;;; 
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)

;; AquaSKKの辞書サーバ
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)
(setq mac-pass-control-to-system nil)

;;辞書ファイルの文字コード設定
(setq skk-jisyo-code 'utf-8-unix)

;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;;漢字登録時、送り仮名が厳密に正しいかをチェック
(setq skk-check-okurigana-on-touroku t)

;; 動的補完
(setq skk-dcomp-multiple-activate t
      skk-dcomp-multiple-rows 20)
(setq skk-comp-use-prefix t)
(setq skk-comp-circulate t)
;(define-key skk-j-mode-map (kbd "<down>") 'skk-completion-wrapper)

;; stickey-shift
(defun skk-mode-hook--unset-key ()
  (define-key skk-j-mode-map ";" nil))
(add-hook 'skk-mode-hook 'skk-mode-hook--unset-key)
