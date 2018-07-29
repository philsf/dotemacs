
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (zerodark)))
 '(inhibit-startup-screen t)
 '(package-archive-priorities (quote (("melpa-stable" . 1) ("gnu" . 2))))
 '(package-archives
   (quote
    (("melpa-stable" . "http://stable.melpa.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-enable-at-startup t)
 '(package-selected-packages
   (quote
    (use-package magit markdown-mode zerodark-theme pandoc-mode magithub gitlab magit-gitflow auctex ess)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; auto-install selected packages
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;; TeX mode
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Use 'check-parens' in markdown-mode (2015-09-20)
(add-hook 'markdown-mode-hook
	  (lambda ()
	    (when buffer-file-name
	      (add-hook 'after-save-hook
			'check-parens
			nil t))))

;; Use markdown-mode for README.md (GitHub Flavored Markdown) (2015-09-20 - fixed 2016-01-23)
;; (add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'gfm-mode "markdown-mode" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md$" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown$" . gfm-mode) auto-mode-alist))

;; Use pandoc-mode for markdown files (2016-08-03)
(add-hook 'markdown-mode-hook 'pandoc-mode)

;; Magit status (2015-09-22)
(global-set-key (kbd "C-x g") 'magit-status)

;; magithub (2018-07-27)
(use-package magithub
  :after magit
  :ensure t
  :config (magithub-feature-autoinject t))
