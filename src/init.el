(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(setq package-list
      '(ag clojure-mode company fill-column-indicator highlight-parentheses
           magit neotree rainbow-delimiters smartparens
           ruby-mode sane-term solarized-theme whitespace-cleanup-mode))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; color theme and font
(load-theme 'solarized-dark t)
(set-frame-font "Monaco 12")

;; ag
(setq ag-highlight-search t)

;; autocomplete
(add-hook 'after-init-hook 'global-company-mode)

;; smartparens
(smartparens-global-mode t)

;; highlight-parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

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
(global-linum-mode t)
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
