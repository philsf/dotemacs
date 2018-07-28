;; (global-font-lock-mode 1)
;; ;(setq tex-dvi-view-command "kdvi")
;(setq tex-dvi-view-command "xdvi")

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
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (philsf-global)))
 '(custom-safe-themes
   (quote
    ("51ba4e2db6df909499cd1d85b6be2e543a315b004c67d6f72e0b35b4eb1ef3de" "ff79b206ad804c41a37b7b782aca44201edfa8141268a6cdf60b1c0916343bd4" "8e367d9dd0c2bc53d216fceaae1c10bb0ab5e2a3f74ad5886efc18596cb6b6c0" "46745f59a6f44e22fd7b28a2f5d172e99dc06f20a6460ef7e2e1547bd4dbb10c" "b097e86d5a56fb34f8d7e7f10cdea34887e801c40152494e4fc54c1a3bfec49e" "7410d9a225a549456708673711a16e736d060e18145d31565f79658a331908ea" "c117c30db5c03f80d751b4237fefa19f289a89c064c16f2a71ace5b989bf2b12" "d997b3917b4929de98b0f1d0f1885a1e817b7167e722aac7c79a2f11f30ea476" "a1ab68e3fbfef75eb91b31e32170913f1c60a6e903d9057a51fee7c6395ed9a0" "b5715f89290691b507de6aa532b75db45ca1bd1e1b81a959bf3f225601d844e7" "6570843991e40121f854432826e9fd175aec6bd382ef217b2c0c46da37f3af18" "7a6936c94b90024f0cfa7c7579667093cda75a8f17761617c63ba80d6de6db33" "d552a89a5691c846c42efda2d9eca85b07375baf1a373a13cd3e2381affca692" "75a696bc7160537d6071073f50422d1db6315ea303d33d622dbf5d8d413add0f" "587d5e8ac355074b51471b7ecdf05213a33f40515fd5027e4796ea6370a7efa8" "555065b4cca21d27b1c799633e0e3cc7c02be5b19d93c1fcd6818e3f1ed08944" default)))
 '(default-input-method "rfc1345")
 '(display-time-mode t)
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers . t)
     (ess-fl-keyword:operators . t)
     (ess-fl-keyword:delimiters . t)
     (ess-fl-keyword:= . t)
     (ess-R-fl-keyword:F&T . t)
     (ess-R-fl-keyword:%op% . t))))
 '(global-font-lock-mode t)
 '(inhibit-startup-screen t)
 '(mouse-wheel-mode t)
 '(package-archives
   (quote
    (("melpa-stable" . "http://stable.melpa.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq visible-bell t)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq compilation-window-height 8)
(setq compilation-finish-function
      (lambda (buf str)

        (if (string-match "exited abnormally" str)

            ;;there were errors
            (message "compilation errors, press C-x ` to visit")

          ;;no errors, make the compilation window go away in 0.5 seconds
          (run-at-time 0.5 nil 'delete-windows-on buf)
          (message "NO COMPILATION ERRORS!"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-9 will make emacs frame transparent with this code

(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tips from http://soundandcomplete.com/post/21038270357/emacs-as-the-ultimate-latex-editor
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq TeX-save-query nil)
;; (setq TeX-PDF-mode t)

;; ;; dvc Changelog entries (2013-12-12)
;; (setq user-mail-address "philsf79@gmail.com")  ;; default: user@host
;; (setq change-log-default-name "Changelog")   ;; default: ChangeLog

(require 'iso-transl)

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

;; Magit status (2015-09-22)
(global-set-key (kbd "C-x g") 'magit-status)

;; magithub (2018-07-27)
(use-package magithub
  :after magit
  :ensure t
  :config (magithub-feature-autoinject t))

;; gitflow ( 2018-07-28)
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; Use pandoc-mode for markdown files (2016-08-03)
(add-hook 'markdown-mode-hook 'pandoc-mode)

;; (setq my-prefered-font
;;       (cond ((eq system-type 'windows-nt) "consolas")
;;             ((eq system-type 'gnu/linux) "mono")
;;             (t nil)))

;; (when my-prefered-font
;;   (set-frame-font my-prefered-font nil t))

;; (load-file (expand-file-name
;;             (cond ((eq system-type 'windows-nt) "windows.el")
;;                   ((eq system-type 'gnu/linux) "linux.el")
;;                   (t "global.el"))
;;             user-emacs-directory))
