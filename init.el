
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

;; Magit status (2015-09-22)
(global-set-key (kbd "C-x g") 'magit-status)
