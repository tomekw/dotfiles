(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(setq package-list
      '(clojure-mode highlight-parentheses magit rainbow-delimiters
		     smartparens ruby-mode solarized-theme))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; color-theme
(load-theme 'solarized-dark t)

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

;; various
(global-linum-mode t)
(tool-bar-mode -1)
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(global-set-key (kbd "C-M-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-x g") 'magit-status)
