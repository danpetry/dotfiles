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
		      ido-vertical-mode
		      smex))
 
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


;(require 'helm-config)
;(helm-mode 1)

(projectile-global-mode)


(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)



;(require 'smartparens-config)
;(show-smartparens-mode 1)
;(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

(show-paren-mode 1)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

(setq mouse-yank-at-point t)

(setq cider-repl-use-clojure-font-lock t)

;; Slow down mouse scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Smoother scrolling
(setq redisplay-dont-pause t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(default ((t (:family "Nimbus Mono L" :foundry "urw" :slant normal :weight normal :height 109 :width normal)))))
