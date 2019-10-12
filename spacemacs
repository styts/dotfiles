;; -*- mode: emacs-lisp -*-
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
   '(python
     php
     typescript
     csv
     nginx
     (chrome :variables chrome-exec-path "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
     ocaml
     (auto-completion :disabled-for org spacemacs-org git react :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-tab-key-behavior 'expand
                      auto-completion-enable-help-tooltip t)
     emacs-lisp
     git
     helm
     html
     javascript
     markdown
     (node :variable node-add-modules-path)
     (vue :variables vue-backend 'lsp)
     lsp
     (org :variables
          org-use-speed-commands t
          org-want-todo-bindings t)
     (ranger :variables ranger-show-preview t)
     osx
     react
     shell-scripts
     spell-checking
     spacemacs-layouts
     sql
     (syntax-checking :variables
                      syntax-checking-enable-tooltips nil
                      syntax-checking-use-original-bitmaps t)
     vimscript
     yaml
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      angular-snippets
                                      centered-cursor-mode
                                      flycheck-clojure
                                      flycheck-pos-tip
                                      free-keys
                                      nodejs-repl
                                      prettier-js
                                      keyfreq
                                      solarized-theme
                                      ;; wakatime-mode
                                      restclient
                                      deferred
                                      scad-mode
                                      sparql-mode
                                      request
                                      editorconfig
                                      ;; next 4 are for vue.js
                                      ;; vue-mode
                                      ;; lsp-mode
                                      ;; lsp-vue
                                      ;; company-lsp
                                      (stylus-mode :location (recipe :fetcher github :repo "vladh/stylus-mode"))
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 0)
                                (projects . 0))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolata for Powerline"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 0.9

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
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

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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
   dotspacemacs-enable-server t

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(defun dotspacemacs/user-config ()
  ;; (spacemacs/toggle-truncate-lines-on)
  ;; (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  ;; disable line breaks by default

  ;; fullscreen shortcut
  (global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

  ;; explain font
  (global-set-key (kbd "<F4>") 'describe-face)

  (add-hook 'prog-mode-hook 'spacemacs/toggle-truncate-lines-on)
  ;; set powerline separator
  (setq powerline-default-separator 'wave)
  (spaceline-compile)
  ;; ensure powerline colors don't stand out incorrectly
  (setq ns-use-srgb-colorspace nil)

  ;; save all buffers when window loses focus
  (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

  ;; open file in project
  (define-key evil-normal-state-map (kbd "r") 'helm-projectile-find-file)

  ;; save buffer even if it has not been modified
  (define-key evil-normal-state-map (kbd "SPC f s") 'save-buffer-always)

  ;; scroll by visual line
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  ;; toggle comments
  (define-key evil-normal-state-map (kbd "SPC c SPC") #'spacemacs/comment-or-uncomment-lines)

  ;; server edit
  (define-key evil-normal-state-map (kbd "SPC f S") #'server-edit)

  ;; navigate windows nicely
  (define-key evil-normal-state-map (kbd "C-h") #'evil-window-left)
  ;; (define-key evil-normal-state-map (kbd "C-j") #'evil-window-down)
  ;; (define-key evil-normal-state-map (kbd "C-k") #'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") #'evil-window-right)
  (define-key evil-normal-state-map (kbd "H-h") #'evil-window-left)
  (define-key evil-normal-state-map (kbd "H-j") #'evil-window-down)
  (define-key evil-normal-state-map (kbd "H-k") #'evil-window-up)
  (define-key evil-normal-state-map (kbd "H-l") #'evil-window-right)

  ;; scrolling with cmd-u, cmd-d
  (define-key (current-global-map) (kbd "C-j") #'evil-scroll-down)
  (define-key (current-global-map) (kbd "C-k") #'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "C-j") #'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "C-k") #'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "H-u") #'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "H-d") #'evil-scroll-down)

  ;; search-default-mode
  (setq evil-search-module 'evil-search)

  ;; SPC-q-q should not kill the emacs server
  (evil-leader/set-key "q q" #'spacemacs/frame-killer)

  ;; shell on pinky
  (define-key evil-normal-state-map (kbd "§") #'spacemacs/default-pop-shell)

  ;; center cursor
  (and (require 'centered-cursor-mode) (global-centered-cursor-mode +1))

  ;; neotree
  (setq neo-smart-open t)
  (evil-define-key 'evilified neotree-mode-map (kbd "C-l") 'select-window-1)

  ;; keyfeq statistics
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)

  (define-key evil-normal-state-map (kbd "SPC s n") #'yas-new-snippet)
  (define-key evil-normal-state-map (kbd "SPC s v") #'yas-visit-snippet-file)

  ;; js
  (setq-default
   ;; js2-mode
   ;; js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)
  (setq js2-strict-missing-semi-warning nil)
  (setq-default typescript-indent-level 2)

  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (with-eval-after-load 'mode-local
    (setq-mode-local json-mode web-beautify-args (quote ("--indent-size 2" "-f" "-"))))
  (with-eval-after-load 'js2-mode
    (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules))
  (with-eval-after-load 'vue-mode
    (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules))
  ;; 2 space indent also for element's attributes, concatenations and contiguous function calls:
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "p" 'prettier-js)

  (defun iterm-repeat-last-command ()
    (interactive)
    (do-applescript
     (concat
      "tell application \"iTerm2\"\n"
      "  delay 0.2"
      "  activate\n"
      "    tell current session of current window\n"
      "      tell application \"System Events\" to keystroke (ASCII character 30)\n" ;; up arrow
      "      tell application \"System Events\" to key code 36\n" ;; return
      "    end tell\n"
      "end tell\n")))
  (define-key evil-normal-state-map (kbd "H-i") #'iterm-repeat-last-command)
  (define-key evil-normal-state-map (kbd "s-t")
    (lambda () (interactive) (shell-command "restart-tropy.sh")))

  ;; js-repl
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode
    "e e" 'nodejs-repl-send-last-sexp
    "e b" 'nodejs-repl-send-buffer
    "e r" 'nodejs-repl-send-region
    "s s" 'nodejs-repl-switch-to-repl
    )

  (spacemacs/set-leader-keys-for-major-mode 'vue-mode
    "e e" 'eslint-fix-file)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode
    "e e" 'eslint-fix-file)

  ;; auto-completion, snippets
  (global-company-mode)
  (yas-global-mode 1)

  ;; reload chrome
  (define-key evil-normal-state-map (kbd "SPC a r")
    (lambda () (interactive) (shell-command "reload-chrome.sh")))

  ;; which-key
  (setq which-key-idle-delay 0.4)
  (setq which-key-max-description-length 60) ;; ensure full function names are shown

  ;; restore frames as well as buffers/windows
  ;; (desktop-save-mode 1)

  ;; g s without leader mirror SPC mapping
  (define-key evil-normal-state-map (kbd "g s") #'magit-status)

  ;; disable files with .#
  (setq create-lockfiles nil)

  ;; evil paste multiple times
  (defun evil-paste-after-from-0 ()
    (interactive)
    (let ((evil-this-register ?0))
      (call-interactively 'evil-paste-after)))
  (define-key evil-visual-state-map "p" 'evil-paste-after-from-0)

  ;; time tracking
  ;; (global-wakatime-mode)

  ;; ranger  / dired file manager
  (setq ranger-override-dired t)
  (setq ranger-show-dotfiles nil)
  (define-key evil-normal-state-map (kbd "SPC d") #'deer)

  ;; silence annoying questions
  (setq vc-follow-symlinks t)

  ;; tramp fix ssh
  (setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

  ;; save file when exiting insert mode
  (defun my-save-if-bufferfilename ()
    (if (buffer-file-name)
        (progn (save-buffer))))
  (add-hook 'evil-insert-state-exit-hook 'my-save-if-bufferfilename)

  ;; don't truncate lines
  (spacemacs/toggle-truncate-lines-on)

  ;; expand region, clicking v multiple times
  (define-key evil-visual-state-map (kbd "v") #'er/expand-region)

  ;; prev/next buffer
  (define-key evil-normal-state-map (kbd "[ [") #'previous-buffer)
  (define-key evil-normal-state-map (kbd "] ]") #'next-buffer)

  ;; focus into new split
  (define-key evil-normal-state-map (kbd "SPC w v") #'split-window-right-and-focus)
  (define-key evil-normal-state-map (kbd "SPC w h") #'split-window-below-and-focus)

  ;; sync configuration
  (define-key evil-normal-state-map (kbd "SPC f e r") #'dotspacemacs/sync-configuration-layers)

  ;; ORG
  (define-key evil-normal-state-map (kbd "<backspace>") #'org-capture)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "p" 'org-priority)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "z" 'hide-sublevels)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "c" nil)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "ci" 'org-clock-in)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "co" 'org-clock-out)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "cp" 'org-pomodoro)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "ef" 'org-html-export-to-html)

  ;; tezos
  ;; (load-file "/Users/kirill/Projects/tz/code/emacs/michelson-mode.el")
  ;; (setq michelson-client-command "/usr/local/bin/alphanet.sh client")
  ;; (setq michelson-alphanet t)

  (setq org-want-todo-bindings t)
  (setq org-directory "~/Personal/org")
  (setq org-default-notes-file "~/Personal/notes.org")
  (setq org-capture-templates
        '(("t" "TODO")
          ("tt" "TODO" entry (file+headline "personal.org" "Tasks") "* TODO %?\n %U")
          ("te" "Editor / Environment customization" entry (file+headline "emacs.org" "Tasks") "* TODO %?\n %U")
          ("tw" "Work task" entry (file+headline "ecs.org" "Tasks") "* TODO %?\n %U")
          ("b" "Buy")
          ("bi" "Buy - IKEA" entry (file+headline "buy.org" "IKEA") "* %?")
          ("ba" "Buy - Amazon" entry (file+headline "buy.org" "Amazon") "* %?")
          ("bb" "Buy - Baumarkt, Baumax, Obi" entry (file+headline "buy.org" "Baumarkt") "* %?")
          ("n" "Notes")
          ("nn" "Notes - General note" entry (file+headline "personal.org" "Notes") "* %?\n%U")
          ("np" "Notes - People" entry (file+headline "personal.org" "People") "* %?\n%U")
          ("nl" "Notes - Log" entry (file+headline "personal.org" "Log") "* %?\n%U")
          ))

  ;; workaround for uncompressing issue
  ;; https://github.com/company-mode/company-mode/issues/525#issuecomment-254981015
  (eval-after-load 'semantic
    (add-hook 'semantic-mode-hook
              (lambda ()
                (dolist (x (default-value 'completion-at-point-functions))
                  (when (string-prefix-p "semantic-" (symbol-name x))
                    (remove-hook 'completion-at-point-functions x))))))

  ;; helm
  (setq helm-ff-newfile-prompt-p nil) ;; prevent the prompt: "File does not exist, create buffer?"
  (setq helm-use-frame-when-more-than-two-windows nil)
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "C-d") 'helm-next-page)
    (define-key helm-map (kbd "C-u") 'helm-previous-page))

  ;; cider/clojure/lisp
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode ","
    'eval-sexp-fu-cider-eval-sexp-inner-sexp)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode ","
    'cider-eval-sexp-at-point)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "w"
    (lambda () (interactive) (lisp-state-wrap)))

  (defun insert-date ()
    (interactive)
    (insert (format-time-string "%Y-%m-%d %H:%m")))

  (with-eval-after-load 'flycheck (flycheck-pos-tip-mode))

  ;; Vue.js
  ;; (require 'vue-mode)
  ;; (add-to-list 'vue-mode-hook #'smartparens-mode)
  ;; (require 'lsp-mode)
  ;; (require 'lsp-vue)
  ;; (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
  ;; (with-eval-after-load 'lsp-mode
  ;; (require 'lsp-flycheck))
  ;; (require 'company-lsp)
  ;; (push 'company-lsp company-backends)

  ;; Umlauts
  (global-unset-key (kbd "M-s"))
  (global-set-key (kbd "M-s") (lambda () "Insert ß." (interactive) (insert "ß")))
  (global-unset-key (kbd "M-u"))
  (global-set-key (kbd "M-u a") (lambda () "Insert ä." (interactive) (insert "ä")))
  (global-set-key (kbd "M-u A") (lambda () "Insert Ä." (interactive) (insert "Ä")))
  (global-set-key (kbd "M-u o") (lambda () "Insert ö." (interactive) (insert "ö")))
  (global-set-key (kbd "M-u O") (lambda () "Insert Ö." (interactive) (insert "Ö")))
  (global-set-key (kbd "M-u u") (lambda () "Insert ü." (interactive) (insert "ü")))
  (global-set-key (kbd "M-u U") (lambda () "Insert Ü." (interactive) (insert "Ü")))

  (add-to-list 'auto-mode-alist '("\\.sparql$" . sparql-mode))
)

; osx copy/paste
; http://emacs.stackexchange.com/questions/10900/copy-text-from-emacs-to-os-x-clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(if (eq system-type 'darwin)
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx))

; comment or uncomment, from
; http://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
"Comments or uncomments the region or the current line if there's no active region."
(interactive)
(let (beg end)
(if (region-active-p)
      (seq beg (region-beginning) end (region-end))
    (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun copy-filename-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
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
 '(company-minimum-prefix-length 2)
 '(evil-want-Y-yank-to-eol nil)
 '(exec-path-from-shell-check-startup-files nil)
 '(js-indent-level 2)
 '(org-agenda-files '("~/org/tezos-red.org"))
 '(package-selected-packages
   '(lsp-ui lsp-treemacs lv lsp-python-ms helm-lsp company-lsp lsp-mode tide typescript-mode editorconfig scad-mode reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl csv-mode yaml-mode ws-butler winum which-key web-mode web-beautify wakatime-mode volatile-highlights vimrc-mode vi-tilde-fringe uuidgen utop use-package tuareg caml toc-org tagedit sql-indent spaceline powerline solarized-theme smeargle slim-mode scss-mode sass-mode restclient restart-emacs ranger rainbow-delimiters pug-mode prettier-js popwin persp-mode pcre2el paradox orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file ocp-indent nodejs-repl nginx-mode neotree move-text mmm-mode merlin markdown-toc markdown-mode magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint less-css-mode keyfreq json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang indent-guide hydra hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh marshal logito pcache ht gh-md fuzzy free-keys flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck-clojure cider seq spinner queue clojure-mode flycheck pkg-info epl flx-ido flx fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight emmet-mode elisp-slime-nav dumb-jump f diminish define-word deferred dactyl-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-quickhelp pos-tip company column-enforce-mode coffee-mode clean-aindent-mode centered-cursor-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed angular-snippets dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))
 '(wakatime-cli-path "/usr/local/Cellar/wakatime-cli/8.0.3/libexec/bin/wakatime")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 2)
 '(evil-want-Y-yank-to-eol nil)
 '(exec-path-from-shell-check-startup-files nil)
 '(js-indent-level 2)
 '(org-agenda-files '("~/org/tezos-red.org"))
 '(package-selected-packages
   '(tide typescript-mode editorconfig scad-mode reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl csv-mode yaml-mode ws-butler winum which-key web-mode web-beautify wakatime-mode volatile-highlights vimrc-mode vi-tilde-fringe uuidgen utop use-package tuareg caml toc-org tagedit sql-indent spaceline powerline solarized-theme smeargle slim-mode scss-mode sass-mode restclient restart-emacs ranger rainbow-delimiters pug-mode prettier-js popwin persp-mode pcre2el paradox orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file ocp-indent nodejs-repl nginx-mode neotree move-text mmm-mode merlin markdown-toc markdown-mode magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint less-css-mode keyfreq json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang indent-guide hydra hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh marshal logito pcache ht gh-md fuzzy free-keys flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck-clojure cider seq spinner queue clojure-mode flycheck pkg-info epl flx-ido flx fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight emmet-mode elisp-slime-nav dumb-jump f diminish define-word deferred dactyl-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-quickhelp pos-tip company column-enforce-mode coffee-mode clean-aindent-mode centered-cursor-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed angular-snippets dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))
 '(wakatime-cli-path "/usr/local/Cellar/wakatime-cli/8.0.3/libexec/bin/wakatime")
 '(wakatime-python-bin nil))

(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat flycheck-javascript-eslint-executable " --fix " (buffer-file-name))))
