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
 '(package-selected-packages
   (quote
    (ess zerodark-theme use-package pandoc-mode magithub magit-gitflow gitlab csv-mode auctex)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq visible-bell t)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

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

;; (require 'iso-transl)

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
