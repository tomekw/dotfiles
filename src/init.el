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
(setq ns-right-alternate-modifier nil)
(setq require-final-newline t)
(setq use-package-always-ensure t)

(bind-key "C-M-f" 'toggle-frame-fullscreen)
(bind-key "C-x <up>" 'windmove-up)
(bind-key "C-x <down>" 'windmove-down)
(bind-key "C-x <left>" 'windmove-left)
(bind-key "C-x <right>" 'windmove-right)
(bind-key "s-r" 'query-replace)
(bind-key "<s-tab>" 'dabbrev-expand)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-mode inf-ruby helm yaml-tomato whitespace-cleanup-mode web-mode use-package smartparens scss-mode sane-term ruby-hash-syntax rspec-mode rbenv rainbow-delimiters puppet-mode projectile-rails markdown-mode magit highlight-parentheses helm-projectile helm-ag farmhouse-theme evil-leader ensime cider alchemist)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-type-face ((t (:foreground "turquoise3")))))

(use-package alchemist)

(use-package cider)

(use-package clojure-mode)

(use-package company
  :diminish company-mode
  :init (add-hook 'after-init-hook 'global-company-mode))

(use-package elixir-mode)

(use-package ensime)

(use-package evil-leader
  :init (progn (global-evil-leader-mode)
               (evil-leader/set-leader ",")))

(use-package evil
  :init (evil-mode 1))

(use-package farmhouse-theme
  :init (progn (load-theme 'farmhouse-dark t)
               (set-frame-font "Monaco 12")))

(use-package go-mode
  :init (setq default-tab-width 2))

(use-package helm
  :diminish helm-mode
  :init (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)))

(use-package helm-ag
  :init (defalias 'ag 'projectile-helm-ag))

(use-package helm-projectile
  :init (defun projectile-helm-ag ()
          (interactive)
          (helm-ag (projectile-project-root))))

(use-package highlight-parentheses
  :init (progn (define-globalized-minor-mode global-highlight-parentheses-mode
                 highlight-parentheses-mode
                 (lambda ()
                   (highlight-parentheses-mode t)))
               (global-highlight-parentheses-mode t)))

(use-package inf-ruby
  :init (add-hook 'after-init-hook 'inf-ruby-switch-setup))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :config (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(use-package projectile
  :diminish projectile-mode
  :init (progn (setq inhibit-startup-screen t)
               (projectile-global-mode)
               (setq projectile-completion-system 'helm)
               (require 'helm-projectile)
               (helm-projectile-on)))

(use-package projectile-rails
  :init (projectile-rails-global-mode))

(use-package puppet-mode)

(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rbenv
  :init (progn (setq rbenv-show-active-ruby-in-modeline nil)
               (global-rbenv-mode)))

(use-package recentf
  :init (progn (recentf-mode 1)
               (add-to-list 'recentf-exclude ".git")
               (add-to-list 'recentf-exclude "elpa"))
  :bind ("C-x C-r" . helm-recentf))

(use-package rspec-mode)

(use-package ruby-hash-syntax)

(use-package ruby-mode
  :init (setq ruby-insert-encoding-magic-comment nil))

(use-package sane-term
  :init (setq sane-term-shell-command "/usr/local/bin/zsh")
  :bind ("M-t" . sane-term))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package scala-mode
  :interpreter ("scala" . scala-mode))

(use-package scss-mode
  :init (progn (setq scss-compile-at-save nil)
               (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))))

(use-package smartparens
  :init (progn (smartparens-global-mode t)
               (show-smartparens-global-mode t)
               (require 'smartparens-config)
               (sp-with-modes '(elixir-mode)
                 (sp-local-pair "fn" "end"
                                :when '(("SPC" "RET"))
                                :actions '(insert navigate))
                 (sp-local-pair "do" "end"
                                :when '(("SPC" "RET"))
                                :post-handlers '(sp-ruby-def-post-handler)
                                :actions '(insert navigate)))))

(use-package web-mode
  :init (progn (setq web-mode-markup-indent-offset 2)
               (setq web-mode-css-indent-offset 2)
               (setq web-mode-code-indent-offset 2)
               (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))))

(use-package whitespace-cleanup-mode
  :init (global-whitespace-cleanup-mode t))

(use-package yaml-tomato)
