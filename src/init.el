(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))

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
(set-fringe-mode '(0 . 0))
(setq-default indent-tabs-mode nil)
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(bind-key "C-M-f" 'toggle-frame-fullscreen)
(bind-key "C-x <up>" 'windmove-up)
(bind-key "C-x <down>" 'windmove-down)
(bind-key "C-x <left>" 'windmove-left)
(bind-key "C-x <right>" 'windmove-right)
(bind-key "s-r" 'query-replace)
(bind-key "<s-tab>" 'dabbrev-expand)

(custom-set-variables
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces)

(use-package cider
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package company
  :ensure t
  :diminish company-mode
  :init (add-hook 'after-init-hook 'global-company-mode))

(use-package evil-leader
  :ensure t
  :init (progn (global-evil-leader-mode)
               (evil-leader/set-leader ",")))

(use-package evil
  :ensure t
  :init (evil-mode 1))

(use-package farmhouse-theme
  :ensure t
  :init (progn (load-theme 'farmhouse-dark t)
               (set-frame-font "Monaco 12")))

(use-package helm
  :ensure t
  :diminish helm-mode
  :init (helm-mode 1)
  :bind ("M-x" . helm-M-x))

(use-package helm-ag
  :ensure t
  :init (defalias 'ag 'projectile-helm-ag))

(use-package helm-projectile
  :ensure t
  :init (defun projectile-helm-ag ()
          (interactive)
          (helm-ag (projectile-project-root))))

(use-package highlight-parentheses
  :ensure t
  :init (progn (define-globalized-minor-mode global-highlight-parentheses-mode
                 highlight-parentheses-mode
                 (lambda ()
                   (highlight-parentheses-mode t)))
               (global-highlight-parentheses-mode t)))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init (progn (setq inhibit-startup-screen t)
               (projectile-global-mode)
               (setq projectile-completion-system 'helm)
               (require 'helm-projectile)
               (helm-projectile-on)))

(use-package projectile-rails
  :ensure t
  :init (add-hook 'projectile-mode-hook 'projectile-rails-on))

(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rbenv
  :ensure t
  :init (rbenv-use-corresponding))

(use-package recentf
  :ensure t
  :init (progn (recentf-mode 1)
               (add-to-list 'recentf-exclude ".git")
               (add-to-list 'recentf-exclude "elpa"))
  :bind ("C-x C-r" . helm-recentf))

(use-package rspec-mode
  :ensure t)

(use-package ruby-hash-syntax
  :ensure t)

(use-package ruby-mode
  :ensure t)

(use-package sane-term
  :ensure t
  :init (setq sane-term-shell-command "/usr/local/bin/zsh")
  :bind ("M-t" . sane-term))

(use-package scss-mode
  :ensure t
  :init (progn (setq scss-compile-at-save nil)
               (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))))

(use-package smartparens
  :ensure t
  :init (progn (smartparens-global-mode t)
               (show-smartparens-global-mode t)
               (require 'smartparens-config)))

(use-package web-mode
  :ensure t
  :init (progn (setq web-mode-markup-indent-offset 2)
               (setq web-mode-css-indent-offset 2)
               (setq web-mode-code-indent-offset 2)
               (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))))

(use-package whitespace-cleanup-mode
  :ensure t
  :init (global-whitespace-cleanup-mode t))
