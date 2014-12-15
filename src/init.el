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
        go-mode
        helm
        helm-ag
        helm-projectile
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
        scss-mode
        web-mode
        whitespace-cleanup-mode))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; ag
(setq ag-highlight-search t)

;; autocomplete
(add-hook 'after-init-hook 'global-company-mode)

;; go-mode
(add-hook 'go-mode-hook
          (lambda ()
            (setenv "PATH" (concat "/user/local/opt/go/libexec/bin:" (getenv "HOME") "/depot/go:" (getenv "PATH")))
            (setenv "GOPATH" (concat (getenv "HOME") "/depot/go"))
            (push (concat (getenv "GOPATH") "/bin") exec-path)
            (setq gofmt-command "goimports")
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 2)
            (setq indent-tabs-mode 1)
            (set (make-local-variable 'compile-command)
                 "go vet && go test -cover -v && go build -v")))

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)
(defalias 'ag 'helm-ag)
(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))

;; highlight-parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; neotree
(global-set-key (kbd "M-n") 'neotree-toggle)

;; projectile
(setq inhibit-startup-screen t)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(require 'helm-projectile)
(helm-projectile-on)

;; rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; red line after 80 characters
(add-hook 'after-change-major-mode-hook 'fci-mode)
(setq fci-rule-column 80)
(setq fci-rule-color "red")

;; rspec-mode
(setenv "PATH" (concat "/Users/tomek/.rbenv/shims:" (getenv "PATH")))

;; scss-mode
(setq scss-compile-at-save nil)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; smartparens
(smartparens-global-mode t)
(show-smartparens-global-mode t)
(require 'smartparens-config)

;; terminal support
(setq sane-term-shell-command "/usr/local/bin/zsh")
(global-set-key (kbd "M-t") 'sane-term)

;; web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; various
(load-theme 'monokai t)
(set-frame-font "Monaco 12")

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
(global-whitespace-cleanup-mode t)

(global-set-key (kbd "C-M-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

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
