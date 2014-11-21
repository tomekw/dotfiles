(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(setq package-list
      '(ag
        cider
        clojure-mode
        company
        fill-column-indicator
        flx-ido
        go-mode
        highlight-parentheses
        js2-mode
        magit
        markdown-mode
        monokai-theme
        neotree
        projectile
        projectile-rails
        rainbow-delimiters
        rspec-mode
        ruby-mode
        smartparens
        sane-term
        web-mode
        whitespace-cleanup-mode))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; color theme and font)
(load-theme 'monokai t)
(set-frame-font "Monaco 12")

;; ag
(setq ag-highlight-search t)

;; autocomplete
(add-hook 'after-init-hook 'global-company-mode)

;; smartparens
(smartparens-global-mode t)
(show-smartparens-global-mode t)
(require 'smartparens-config)

;; highlight-parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; projectile
(setq inhibit-startup-screen t)
(projectile-global-mode)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

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
(setq linum-format "%5d ")
(column-number-mode 1)
(scroll-bar-mode -1)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
