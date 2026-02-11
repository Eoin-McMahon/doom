;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'latte) ;; or 'latte, 'macchiato, or 'mocha

;; set line length
(setq-default fill-column 90)
(after! whitespace
  (setq whitespace-line-column 90))

;; Only one buffer for dired navigation
(setf dired-kill-when-opening-new-dired-buffer t)

;; abbreviated paths
(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project))

;; projectile opens projects in dired by default
(after! projectile
(setq projectile-switch-project-action 'projectile-dired))


;;(setq door-theme 'everforest-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 20 ))

;;; --------------------------
;;; vterm setup (Shackle)
;;; --------------------------

;; (after! shackle
;;   (shackle-mode +1)
;;   (setq shackle-rules
;;         '((vterm-mode
;;            :align right
;;            :size 0.4
;;            :select t
;;            :popup t
;;            :reuse t))))

;;; --------------------------
;;; Popper defaults + keybindings
;;; --------------------------

;; (use-package! popper
;;   :bind (("C-'"   . popper-toggle)
;;          ("M-'"   . popper-cycle)
;;          ("C-M-'" . popper-toggle-type))
;;   :init
;;   (popper-mode +1)
;;   (popper-echo-mode +1)
;;   :config
;;   ;; Default popper buffers (remove Messages to avoid hijack)
;;   (setq popper-reference-buffers
;;         '("^\\*Warnings\\*$"
;;           "^\\*eshell.*\\*$"
;;           eshell-mode
;;           "^\\*shell.*\\*$"
;;           shell-mode
;;           "^\\*term.*\\*$"
;;           term-mode
;;           "^\\*vterm.*\\*$"
;;           vterm-mode)))

;; ;; Popper does not control how buffers are displayed:
;; (setq popper-display-control 'user)
;; (setq popper-group-function #'popper-group-by-projectile) ; projectile projects


;; (setq popper-display-control nil))




;;; vterm: right-side vertical popup
;;; vterm: right-side vertical popup (guaranteed)
(after! vterm
  (setq vterm-timer-delay nil))

(use-package! vterm-toggle
  :after vterm)

(after! vterm-toggle
  ;; Open vterm in a vertical split
  (setq vterm-toggle-fullscreen-p nil)

  ;; Make it vertical on the right
  (setq vterm-toggle-scope 'project) ;; optional but recommended

  (add-to-list 'display-buffer-alist
               '("^\\*vterm\\*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (slot . 0)
                 (window-width . 0.5))))


(map! :leader
      :desc "Toggle vterm"
      "`" #'vterm-toggle)

(after! evil
  ;; 1️⃣ Navigation with Ctrl + h/j/k/l
  (define-key evil-normal-state-map (kbd "C-h") #'windmove-left)
  (define-key evil-normal-state-map (kbd "C-j") #'windmove-down)
  (define-key evil-normal-state-map (kbd "C-k") #'windmove-up)
  (define-key evil-normal-state-map (kbd "C-l") #'windmove-right)

  ;; 2️⃣ Resize windows with Ctrl+Shift + h/j/k/l
  (defun evil-resize-left ()  (interactive) (shrink-window-horizontally 5))
  (defun evil-resize-right () (interactive) (enlarge-window-horizontally 5))
  (defun evil-resize-up ()    (interactive) (enlarge-window 5))
  (defun evil-resize-down ()  (interactive) (shrink-window 5))

  (define-key evil-normal-state-map (kbd "C-S-h") #'evil-resize-left)
  (define-key evil-normal-state-map (kbd "C-S-l") #'evil-resize-right)
  (define-key evil-normal-state-map (kbd "C-S-k") #'evil-resize-up)
  (define-key evil-normal-state-map (kbd "C-S-j") #'evil-resize-down))



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.




;; Custom stuff

;; Remove Doom's default dired binding (SPC o -)
(after! dired
  (map! :leader "o -" nil))

;; Bind "-" in normal mode to open dired in the current directory
(map! :n "-" #'dired-jump)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PYTHON + POETRY + DIRENV + LSP (PYRIGHT), NO VENV MAGIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make direnv authoritative over environment
(after! direnv
  (direnv-mode 1))

;; Use pyright as LSP
(after! lsp-mode
  ;; Ensure pyright is used instead of pyls/pylsp
  (setq lsp-disabled-clients '(pyls pylsp)))

(after! lsp-pyright
  ;; pyright automatically picks up the environment from direnv
  (setq lsp-pyright-auto-import-completions t
        lsp-pyright-use-library-code-for-types t))

;; Keep completion engine minimal + extensible
(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

;; Optional: cleaner UI, but not required
(setq +lsp-company-backends '(:separate company-capf company-files))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lsp-ui setup for Doom Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! lsp-ui
  :after lsp-mode
  :init
  ;; Enable the modules you want
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions t

        lsp-ui-doc-enable t
        lsp-ui-doc-delay 0.2
        lsp-ui-doc-max-width 80
        lsp-ui-doc-max-height 20

        lsp-ui-peek-enable t)

  :config
  ;; optional: keymap for peek
  (map! :leader
        (:prefix ("c" . "code")
          "p" #'lsp-ui-peek-find-definitions
          "P" #'lsp-ui-peek-find-references
          "e" #'lsp-ui-flycheck-list)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VTERM SPLIT / BUFFER HELPERS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;; Enable popper globally
;; (use-package! popper
;;   :config
;;   (popper-mode +1)
;;   ;; Recognize all vterm buffers as popups
;;   (push "^\\*vterm.*\\*" popper-reference-buffers))

;; ;; Load vterm on demand
;; (use-package! vterm
;;   :commands vterm)

;; (defun my/toggle-vterm-popup ()
;;   "Toggle a vterm popup. Create one if none exists."
;;   (interactive)
;;   (let* ((buf (get-buffer "*vterm*")))
;;     (if buf
;;         ;; Toggle the popup buffer explicitly
;;         (if (get-buffer-window buf)
;;             (delete-window (get-buffer-window buf))
;;           (popper-display-buffer buf))
;;       ;; Create a new vterm if it doesn't exist
;;       (vterm))))

;; ;; Bind it to SPC t t
;; (map! :leader
;;       :desc "Toggle popup vterm"
;;       "t t" #'my/toggle-vterm-popup)

;; ;; Optional: hook popper-mode to vterm-mode (not strictly needed)
;; ;; (add-hook 'vterm-mode-hook #'popper-mode)

;; ;; Keybindings
;; ;; (map! :leader
;; ;;       :desc "Toggle popup vterm"
;; ;;       "t t" #'popper-toggle
;; ;;       "t n" #'popper-next)


;; Enable Popper globally
(use-package! popper
  :config
  (popper-mode +1)
  ;; Recognize all vterm buffers as popups
  (push "^\\*vterm\\*$" popper-reference-buffers))

;; Load vterm on demand
(use-package! vterm
  :commands vterm
  :config
  ;; Make vterm faster by disabling the timer delay
  (setq vterm-timer-delay nil))

(defun my/toggle-vterm-popup ()
  "Toggle the same vterm popup buffer without killing it."
  (interactive)
  (let ((buf (get-buffer "*vterm*")))
    (if buf
        ;; If buffer exists, just hide/show it
        (if (get-buffer-window buf)
            (delete-window (get-buffer-window buf))   ; hide
          (popper-display-buffer buf))                ; show
      ;; If buffer doesn't exist, create it
      (vterm))))

;; Keybinding
(map! :leader
      :desc "Toggle popup vterm"
      "t t" #'my/toggle-vterm-popup)
