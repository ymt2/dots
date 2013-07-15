;; face
(if window-system
    (progn
      (setq initial-frame-alist 
	    '(
	      (top . 0)
	      (left . 200)
	      (width . 95)
	      (height . 45)))
      (set-background-color "Black")
      (set-foreground-color "LightGray")
      (set-cursor-color "Gray")
      (set-frame-parameter nil 'alpha 95)))
(setq truncate-partial-width-windows nil)
(set-scroll-bar-mode nil)

; font
;(set-face-attribute 'default nil
;                   :family "monaco"
;                    :height 120)
;(set-fontset-font "fontset-default"
;                  'japanese-jisx0208
;                  '("ヒラギノ丸ゴ pro w4*" . "jisx0208.*"))
;(set-fontset-font "fontset-default"
;                  'katakana-jisx0201
;                  '("ヒラギノ丸ゴ pro w4*" . "jisx0201.*"))
;; フォントセットを作る
(let* ((fontset-name "myfonts") ; フォントセットの名前
       (size 12) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
       ;(asciifont "Droid Sans Mono Slashed") ; ASCIIフォント
       (asciifont "monaco")
       (jpfont "Hiragino Maru Gothic ProN") ; 日本語フォント
       (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)) 
       (fsn (create-fontset-from-ascii-font font nil fontset-name)))
  (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
  (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
  (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
  )

(add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

;; フォントサイズの比を設定
(dolist (elt '(("^-apple-hiragino.*" . 1.2)
               (".*osaka-bold.*" . 1.2)
               (".*osaka-medium.*" . 1.2)
               (".*courier-bold-.*-mac-roman" . 1.0)
               (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
               (".*monaco-bold-.*-mac-roman" . 0.9)))
  (add-to-list 'face-font-rescale-alist elt))

;; デフォルトのフレームパラメータでフォントセットを指定
;; # これは起動時に default-frame-alist に従ったフレームが
;; # 作成されない現象への対処
(set-face-font 'default "fontset-myfonts")

; hl linemode
(custom-set-faces 
 '(hl-line
   ((((class color)
      (background dark))
     (:background "#222244"))
    (((class color)
      (background light))
     (:background "LightSteelBlue1")))))
(global-hl-line-mode)

; Inhibit SplashScreen
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

; clear scratch buffer
(setq initial-scratch-message "")

; Visual feedback on selections
(setq-default transient-mark-mode t)

; Highlight matching parenthesis
(when
    (fboundp 'show-paren-mode)
  (show-paren-mode t))

; Line, colum Number
;(require 'linum)
(line-number-mode t)
(column-number-mode t)
;(global-linum-mode t)

; Hide tool-bar
(tool-bar-mode 0)
