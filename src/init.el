(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(setq package-list
      '(cider clojure-mode color-theme-solarized god-mode
	      highlight-parentheses rainbow-delimiters
	      ruby-mode smartparens))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

; cider
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

; color-theme
(load-theme 'solarized-dark t)

; highlight-parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
                              highlight-parentheses-mode
                              (lambda ()
                                (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

; linum
(global-linum-mode t)

; rainbow-delimiters
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

; smartparens
(smartparens-global-mode t)

; various
(tool-bar-mode -1)
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(global-set-key (kbd "C-M-f") 'toggle-frame-fullscreen)
