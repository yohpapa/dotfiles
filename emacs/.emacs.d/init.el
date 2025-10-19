
;; (_)_ __ (_) |_   ___| |
;; | | '_ \| | __| / _ \ |
;; | | | | | | |_ |  __/ |
;; |_|_| |_|_|\__(_)___|_|

;; bootstrap for straight-use-package.el
;; https://github.com/radian-software/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; package repositories
(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; bootstrap for package.el
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; vim style undo not needed for emacs 28
(use-package undo-fu)

;; evil-mode
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  ;; no vim insert bindings
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

;; evil mode everywhere
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

;; disable some UI components
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; theme
(use-package catppuccin-theme
  :config
  ;; Set the desired flavor *before* loading the theme.
  (setq catppuccin-flavor 'mocha)
  (load-theme 'catppuccin t))

;; font
(add-to-list 'default-frame-alist
	     '(font . "FiraCode Nerd Font Mono-7"))

;; fixed emacs window size upon startup
(setq frame-inhibit-implied-resize t)

;; common settings
(setq auto-save-default nil)

;; vertico
(use-package vertico
  :ensure t
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)
	      ("C-f" . vertico-exit)
	      :map minibuffer-local-map
	      ("C-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(straight-use-package '(marginalia :host github :repo "minad/marginalia" :branch "main"))
(marginalia-mode)
