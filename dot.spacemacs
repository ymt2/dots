; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(haskell
     org
     swift
     ruby
     helm
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory "~/.config/emacs/snippets")
     better-defaults
     emacs-lisp
     php
     (python :variables
             python-enable-yapf-format-on-save t)
     java
     yaml
     html
     javascript
     react
     osx
     emoji
     git
     github
     markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     restclient
     (spell-checking :variables enable-flyspell-auto-completion t)
     syntax-checking
     ;; version-control
     gtags
     typescript
     csv
     (go :variables
         go-backend 'lsp
         go-tab-width 4
         go-format-before-save t
         gofmt-command "goimports")
     rust
     nginx
     docker
     ipython-notebook
     terraform
     dash
     graphql
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ddskk
                                      direnv
                                      avy-migemo
                                      helm-ghq
                                      helm-ls-git
                                      imenu-list
                                      request
                                      editorconfig
                                      quickrun
                                      japanese-holidays
                                      review-mode
                                      protobuf-mode
                                      ignoramus
                                      bool-flip
                                      magithub
                                      ox-hugo
                                      madhat2r-theme
                                      prassee-theme
                                      (gotests :location (recipe :fetcher github :repo "damienlevin/GoTests-Emacs"))
                                      eglot
                                      osx-clipboard)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 100)
                                (projects . 100)
                                (todos . 100))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(wombat
                         monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         (zenburn :location (recipe :fetcher github
                                                    :repo "bbatsov/zenburn-emacs")))
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t
   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq system-time-locale "C")
  (setq dotspacemacs-mode-line-theme '(spacemacs :separator 'arrow))
  (setq eyebrowse-keymap-prefix (kbd "C-c e")))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq my:v:text-dir (case system-type
                        ('gnu/linux (let ((uname (shell-command-to-string "uname -a")))
                                      (cond ((string-match "Linux.*Microsoft" uname) "/mnt/d/Dropbox")
                                            ((string-match ".*" uname) (concat (getenv "HOME") "/Dropbox")))))
                        (t (concat (getenv "HOME") "/Dropbox"))))

  (setq open-junk-file-format (concat my:v:text-dir "/junk/%Y/%m/%d-%H%M%S."))

  (setq-default ispell-program-name "aspell")
  (setq-default ispell-dictionary "english")
  (setq ispell-extra-args '("--sug-mode=fast" "--run-together" "--run-together-limit=5" "--run-together-min=2"))

  (with-eval-after-load 'org
    (setq org-directory my:v:text-dir)
    (load-library "find-lisp")
    (setq org-agenda-files (find-lisp-find-files (concat org-directory "/org") "\.org$"))
    (setq org-archive-location
          (concat my:v:text-dir "/org/archive/archive-"
                  (format-time-string "%Y%m" (current-time)) ".org_archive::"))
    ;;(custom-set-variables
    ;; '(org-display-custom-times t)
    ;; '(org-time-stamp-custom-formats
    ;;   '("<%d %b %Y>" . "<%d/%m/%y %a %H:%M>")))
    ;; (org-defkey org-mode-map [(meta return)] 'org-meta-return)
    (setq org-blank-before-new-entry
          '((heading . always)
            (plain-list-item . nil)))
    (setq org-capture-templates
          `(("t" "Todo" entry (file+headline "org/todo.org" "INBOX")
             "* TODO %?\n %i\n %a"
             :empty-lines 1)
            ("n" "Note" entry (file+datetree "org/note.org")
             "* %^{Description} %^g %? Added: %U")))

    (setq org-todo-keywords
          '((sequence "TODO(t)" "ICEBOX(i)" "WAITING(w)" "|" "DONE(d)")))

    ;; ox-hugo
    (defun org-hugo-new-subtree-post-capture-template ()
      "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
      (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
             (fname (org-hugo-slug title)))
        (mapconcat #'identity
                   `(
                     ,(concat "* TODO " title)
                     ":PROPERTIES:"
                     ,(concat ":EXPORT_FILE_NAME: " fname)
                     ":END:"
                     "%?\n")          ;Place the cursor here finally
                   "\n")))

    (add-to-list 'org-capture-templates
                 '("h"                ;`org-capture' binding + h
                   "Hugo post"
                   entry
                   ;; It is assumed that below file is present in `org-directory'
                   ;; and that it has a "Blog Ideas" heading. It can even be a
                   ;; symlink pointing to the actual location of all-posts.org!
                   (file+olp "org/all-posts.org" "Posts")
                   (function org-hugo-new-subtree-post-capture-template))))

  (require 'org-tempo)

  ;; https://github.com/syl20bnr/spacemacs/issues/9549
  (require 'helm-bookmark)

  (setq powerline-default-separator 'zigzag)
  (spaceline-compile)

  (global-set-key "\C-h" 'backward-delete-char)

  (setq blink-cursor-interval 0.6)
  (setq blink-cursor-delay 30.0)
  (blink-cursor-mode 1)

  (setq windmove-wrap-around t)
  (global-set-key [S-left] 'windmove-left)
  (global-set-key [S-right] 'windmove-right)
  (global-set-key [S-up] 'windmove-up)
  (global-set-key [S-down] 'windmove-down)

  (global-set-key [C-delete] '(lambda() (interactive)(kill-buffer (buffer-name))))

  (unless (display-graphic-p)
    (setq linum-format "%4d \u2502 ")
    (setq linum-relative-format "%3s "))

  (custom-set-variables
   '(helm-ag-base-command "rg --no-heading"))

  (define-key global-map (kbd "C-c h") 'helm-ghq)
  (define-key global-map (kbd "C-c g") 'helm-ag)
  (define-key global-map (kbd "C-c C-r") 'helm-recentf)
  (define-key global-map (kbd "C-c i") 'helm-imenu)
  (define-key global-map (kbd "C-c C-g l") 'helm-ls-git-ls)
  (define-key global-map (kbd "C-c C-g d") 'helm-browse-project)
  (define-key global-map (kbd "C-c n") 'flycheck-next-error)
  (define-key global-map (kbd "C-c p") 'flycheck-previous-error)
  (define-key global-map (kbd "C-c d") 'flycheck-list-errors)

  (when (eq system-type 'darwin)
    (setq mac-pass-control-to-system t))

  (spacemacs/toggle-indent-guide-globally-on)

  (use-package calendar
    :config
    (use-package japanese-holidays)
    (setq calendar-holidays ; 他の国の祝日も表示させたい場合は適当に調整
          (append japanese-holidays))
    (setq mark-holidays-in-calendar t) ; 祝日をカレンダーに表示
    ;; 土曜日・日曜日を祝日として表示する場合、以下の設定を追加します。
    ;; デフォルトで設定済み
    (setq japanese-holiday-weekend '(0 6)     ; 土日を祝日として表示
          japanese-holiday-weekend-marker     ; 土曜日を水色で表示
          '(holiday nil nil nil nil nil japanese-holiday-saturday))
    (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
    (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)
    (add-hook 'calendar-today-visible-hook 'calendar-mark-today))

  ;; Replace M-rM-r
  ;;(define-prefix-command 'meta-r-prefix)
  ;;(global-set-key "\M-r" 'meta-r-prefix)
  ;;(global-set-key "\M-r\M-r" 'query-replace)
  ;;(global-set-key "\M-r\M-e" 'query-replace-regexp)

  (use-package request)

  (use-package ggtags
    :defer t
    :init
    (setq ggtags-update-on-save nil))

  (use-package helm-gtags
    :defer t
    :init
    (setq helm-gtags-auto-update nil)
    (add-hook 'prog-mode-hook 'helm-gtags-mode))

  (use-package web-mode
    :defer t
    :init
    (setq web-mode-enable-current-column-highlight t)
    (setq web-mode-enable-engine-detection t))

  ;; js2-mode
  (setq js2-strict-missing-semi-warning nil)
  (setq-default indent-tabs-mode nil)
  (setq-default js2-basic-offset 2
                js-indent-level 2)

  ;; skk
  (if (eq system-type 'darwin)
      (setq skk-get-jisyo-directory "~/.skk.d/skk-get-jisyo"))
  (setq skk-henkan-strict-okuri-precedence t)
  (setq skk-check-okurigana-on-touroku t)
  (setq skk-japanese-message-and-error nil)
  (setq skk-show-japanese-menu nil)
  (setq skk-dcomp-multiple-activate t
        skk-dcomp-multiple-rows 20)
  (setq skk-comp-use-prefix t)
  (setq skk-comp-circulate t)
  (global-set-key (kbd "C-x j") 'skk-auto-fill-mode)
  (setq skk-sticky-key ";")
  (setq skk-jisyo-code 'utf-8)
  (setq skk-save-jisyo-instantly t)
  (setq skk-share-private-jisyo t)

  (defun skk-henkan-C- ()
    (concat "C-" (skk-henkan-ctrl-meta-conversion (read-string "C-"))))
  (defun skk-henkan-M- ()
    (concat "M-" (skk-henkan-ctrl-meta-conversion (read-string "M-") 'meta)))
  (defun skk-henkan-ctrl-meta-conversion (input &optional metap)
    (if (and metap (string= "x" (substring input 0 1)))
        input
      (replace-regexp-in-string
       "c-" "C-"
       (replace-regexp-in-string
        "m-" "M-"
        (replace-regexp-in-string
         "h-" "H-"
         (replace-regexp-in-string
          "ret" "RET"
          (replace-regexp-in-string
           "spc" "SPC"
           (replace-regexp-in-string
            "tab" "TAB"
            (replace-regexp-in-string
             "esc" "ESC"
             (replace-regexp-in-string
              "del" "DEL"
              input))))))))))

  (use-package skk-study)

  ;; context-skk
  ;; (add-hook 'prog-mode-hook 'which-function-mode)
  (add-to-list 'context-skk-programming-mode 'python-mode)
  (add-to-list 'context-skk-programming-mode 'php-mode)

  (use-package migemo
    :if (executable-find "cmigemo")
    :config
    (setq migemo-command "cmigemo")
    (setq migemo-options '("-q" "--emacs"))
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-user-dictionary nil)
    (setq migemo-regex-dictionary nil)
    (setq migemo-coding-system 'utf-8-unix)
    (migemo-init)

    (avy-migemo-mode 1))

  (use-package coffee-mode
    :mode (("\\.cjsx\\'" . coffee-mode)))

  (use-package php-mode
    :init
    (add-hook 'php-mode-hook
              '(lambda()
                 (setq tab-width 4)
                 (setq indent-tabs-mode nil)
                 (setq c-basic-offset 4)
                 (subword-mode 1))))

  (use-package ruby-mode
    :init
    (setq ruby-insert-encoding-magic-comment nil))

  ;; python
  (use-package anaconda-mode
    :init
    (bind-keys :map anaconda-mode-map
               ("M-," . anaconda-mode-go-back)))

  (use-package eyebrowse
    :init
    (bind-keys :map eyebrowse-mode-map
               ("C-M-." . eyebrowse-next-window-config)
               ("C-M-," . eyebrowse-prev-window-config)
               ("C-c w d" . eyebrowse-close-window-config)))

  (use-package review-mode
    :init
    (setq review-mode-name "ymt2")
    (setq review-mode-tip-name "?")
    (setq review-use-skk-mode t)
    (setq review-comment-start "#@# ")
    (setq review-comment-end ""))

  (use-package direnv
    :config
    (direnv-mode))

  (use-package gotests)

  (use-package ignoramus
    :ensure t
    :init
    (ignoramus-setup))

  (use-package bool-flip)

  (use-package osx-clipboard
    :config
    (progn
      (osx-clipboard-mode +1)
      (diminish 'osx-clipboard-mode)))

  (use-package magithub
    :after magit
    :config (magithub-feature-autoinject t))


  (use-package eglot
    :defer t
    :init
    (spacemacs/declare-prefix "ae" "eglot")
    (spacemacs/set-leader-keys "aes" 'eglot
      "aeR" 'eglot-reconnect
      "aeq" 'eglot-shutdown
      "ae=" 'eglot-format
      "aeh" 'eglot-help-at-point
      "aeO" 'eglot-events-buffer
      "aeE" 'eglot-stderr-buffer
      "aer" 'eglot-rename
      "aee" 'eglot-code-actions)
    :config
    (add-hook 'ruby-mode-hook 'eglot-ensure)
    (add-hook 'typescript-mode-hook 'eglot-ensure)
                                        ;(add-to-list 'eglot-server-programs '(foo-mode . ("foo-language-server" "--args")))
                                        ;(add-hook 'foo-mode-hook 'eglot-ensure) ; Connecting automatically, to attempt to start an eglot session automatically everytime a foo-mode buffer is visited.
                                        ;(add-to-list 'eglot-server-programs
                                        ;`(python-mode . ("pyls" "-v" "--tcp" "--host"
                                        ;                "localhost" "--port" :autoport)))
    )

  (use-package ox-hugo
    :ensure t
    :after ox)

  (use-package graphql
    :mode (("\\.graphqls?\\'" . graphql-mode)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(helm-ag-base-command "rg --no-heading")
 '(package-selected-packages
   (quote
    (osx-clipboard flyspell-popup eglot flymake jsonrpc lv helm-dash dash-docs transient polymode dash-at-point org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot magithub ghub+ apiwrap ghub treepy graphql prassee-theme bool-flip ignoramus protobuf-mode terraform-mode hcl-mode company-restclient restclient-helm ob-restclient restclient ob-http know-your-http-well swift-mode flycheck-gometalinter rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby gotests direnv zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme spacemacs-theme review-mode japanese-holidays ein request-deferred websocket deferred dockerfile-mode docker tablist docker-tramp helm-ls-git helm-ghq yapfify yaml-mode web-mode web-beautify unfill toml-mode tide typescript-mode tagedit smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder racer quickrun pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pbcopy osx-trash osx-dictionary orgit nginx-mode mwim mmm-mode markdown-toc markdown-mode magit-gitflow magit-gh-pulls livid-mode skewer-mode simple-httpd live-py-mode less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc imenu-list hy-mode helm-pydoc helm-gtags helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode go-guru go-eldoc gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md ggtags fuzzy flyspell-correct-helm flyspell-correct flycheck-rust seq flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor emoji-cheat-sheet-plus emmet-mode editorconfig drupal-mode php-mode diff-hl ddskk cdb ccc cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company-emoji company-emacs-eclim eclim company-anaconda company coffee-mode cargo rust-mode avy-migemo migemo auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets symon string-inflection spaceline-all-the-icons all-the-icons memoize ruby-refactor ruby-hash-syntax rjsx-mode pippel pipenv password-generator overseer ob-ipython nameless mvn meghanada maven-test-mode magithub ghub+ apiwrap magit-svn json-navigator hierarchy importmagic epc ctable concurrent impatient-mode htmlize helm-xref helm-purpose window-purpose groovy-mode groovy-imports gradle-mode godoctor go-tag go-rename ghub evil-lion evil-goggles evil-cleverparens paredit ensime sbt-mode scala-mode emojify counsel-projectile counsel swiper ivy company-terraform company-php ac-php-core xcscope centered-cursor-mode browse-at-remote font-lock+ protobuf-mode terraform-mode hcl-mode company-restclient restclient-helm ob-restclient restclient ob-http know-your-http-well swift-mode flycheck-gometalinter rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby gotests direnv zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme spacemacs-theme review-mode japanese-holidays ein request-deferred websocket deferred dockerfile-mode docker tablist docker-tramp helm-ls-git helm-ghq yapfify yaml-mode web-mode web-beautify unfill toml-mode tide typescript-mode tagedit smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder racer quickrun pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pbcopy osx-trash osx-dictionary orgit nginx-mode mwim mmm-mode markdown-toc markdown-mode magit-gitflow magit-gh-pulls livid-mode skewer-mode simple-httpd live-py-mode less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc imenu-list hy-mode helm-pydoc helm-gtags helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode go-guru go-eldoc gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md ggtags fuzzy flyspell-correct-helm flyspell-correct flycheck-rust seq flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor emoji-cheat-sheet-plus emmet-mode editorconfig drupal-mode php-mode diff-hl ddskk cdb ccc cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company-emoji company-emacs-eclim eclim company-anaconda company coffee-mode cargo rust-mode avy-migemo migemo auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
)
