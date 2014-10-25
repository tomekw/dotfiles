(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(setq package-list
      '(ag clojure-mode color-theme-sanityinc-tomorrow company
           fill-column-indicator flx-ido highlight-parentheses
           magit neotree projectile rainbow-delimiters smartparens
           ruby-mode sane-term web-mode whitespace-cleanup-mode))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; color theme and font)
(load-theme 'sanityinc-tomorrow-night t)
(set-frame-font "Monaco 12")

;; ag
(setq ag-highlight-search t)

;; autocomplete
(add-hook 'after-init-hook 'global-company-mode)

;; smartparens
(smartparens-global-mode t)
(require 'smartparens-config)

;; highlight-parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; projectile
(setq inhibit-startup-screen t)
(projectile-global-mode)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; red line after 80 characters
(add-hook 'after-change-major-mode-hook 'fci-mode)
(setq fci-rule-column 80)
(setq fci-rule-color "red")

;; cleanup trailing whitespaces
(global-whitespace-cleanup-mode t)

;; terminal support
(setq sane-term-shell-command "/usr/local/bin/zsh")
(global-set-key (kbd "M-t") 'sane-term)

;; various
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-linum-mode t)
(line-number-mode 1)
(column-number-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(global-set-key (kbd "C-M-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "M-n") 'neotree-toggle)
