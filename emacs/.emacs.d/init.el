;;; Startup
;;; PACKAGE LIST
(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; BOOTSTRAP USE-PACKAGE
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;;; UNDO
;; Vim style undo not needed for emacs 28
(use-package undo-fu)

;;; Vim Bindings
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

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package catppuccin-theme
  :config
  ;; Set the desired flavor *before* loading the theme.
  (setq catppuccin-flavor 'mocha)
  (load-theme 'catppuccin t))

;; (use-package zenburn-theme
;;   :config
;;   ;; Set the desired flavor *before* loading the theme.
;;   (load-theme 'zenburn t))

;; common settings
(setq auto-save-default nil)
(add-to-list 'default-frame-alist
	     '(font . "FiraCode Nerd Font-7"))
