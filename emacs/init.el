(require 'package)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages '(paredit
		      projectile
		      clojure-mode
		      cider
		      magit
		      helm
		      slamhound
                      rust-mode
		      cargo
		      ido-vertical-mode
		      smex
		      sass-mode
		      yaml-mode
		      inf-ruby
		      alchemist
		      flycheck
		      flycheck-rust))
 
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


(load-theme 'leuven t)


; ido/ smex

(require 'ido)
(ido-mode t)
(ido-everywhere t)

(require 'ido-vertical-mode)
(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(add-hook 'after-init-hook #'global-flycheck-mode)

;(require 'helm-config)
;(helm-mode 1)

(projectile-global-mode)


(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


; sass-mode
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))


;(require 'smartparens-config)
;(show-smartparens-mode 1)
;(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

; clojure config
(setq mouse-yank-at-point t)
(show-paren-mode 1)

; cider
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-log-messages nil)
(setq nrepl-hide-special-buffers t)
(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")


;; Rust
;; http://julienblanchard.com/2016/fancy-rust-development-with-emacs/

(add-hook 'rust-mode-hook 'cargo-minor-mode) ;; https://github.com/kwrooijen/cargo.el
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; http://emacsist.com/10425
;;(add-hook 'rust-mode-hook
;;	  '(lambda ()
;;	     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)


;; Slow down mouse scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Horizontal mouse scrolling
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) (scroll-left 1)))
(global-set-key (kbd "<mouse-6>") (lambda () (interactive) (scroll-right 1)))
(global-set-key (kbd "<double-mouse-7>") (lambda () (interactive) (scroll-left 2)))
(global-set-key (kbd "<double-mouse-6>") (lambda () (interactive) (scroll-right 2)))
(global-set-key (kbd "<triple-mouse-7>") (lambda () (interactive) (scroll-left 3)))
(global-set-key (kbd "<triple-mouse-6>") (lambda () (interactive) (scroll-right 3)))


;; Smoother scrolling
(setq redisplay-dont-pause t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "cider repl -s wait")
 '(inhibit-startup-screen t)
 '(safe-local-variable-values
   (quote
    ((eval font-lock-add-keywords nil
	   (\`
	    (((\,
	       (concat "("
		       (regexp-opt
			(quote
			 ("sp-do-move-op" "sp-do-move-cl" "sp-do-put-op" "sp-do-put-cl" "sp-do-del-op" "sp-do-del-cl"))
			t)
		       "\\_>"))
	      1
	      (quote font-lock-variable-name-face))))))))
 '(show-paren-mode t)
 '(speedbar-show-unknown-files t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#FFFFFF" :foreground "#333333" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "unknown" :family "Inconsolata"))))
 '(variable-pitch ((t (:family "Liberation Sans")))))
