;; (_)_ __ (_) |_   ___| |
;; | | '_ \| | __| / _ \ |
;; | | | | | | |_ |  __/ |
;; |_|_| |_|_|\__(_)___|_|

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
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode)

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
  (setq vertico-count 20)
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; volatile-highlights
(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(catppuccin-theme evil-collection marginalia undo-fu vertico
		      volatile-highlights zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
