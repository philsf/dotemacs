;; (global-font-lock-mode 1)
;; ;(setq tex-dvi-view-command "kdvi")
;(setq tex-dvi-view-command "xdvi")

;; setting some colors so I can see better
(set-background-color "#e5e5e5")
(set-foreground-color "black")
(set-cursor-color "dark slate blue")
(display-time)

;(scroll-bar-mode -1)
(scroll-bar-mode 1)

(set-scroll-bar-mode 'right)

; retitle emacs window
 (defun frame-retitle (title)
   (modify-frame-parameters
     nil
     (list
       (cons
          'name
          title
       )
     )
   )
 )

 ;; set a beautiful title bar
 (setq frame-title-format
       '("%S: " (buffer-file-name "%f"
                                  (dired-directory dired-directory "%b"))))

(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
   (quote
    ("8e367d9dd0c2bc53d216fceaae1c10bb0ab5e2a3f74ad5886efc18596cb6b6c0" "46745f59a6f44e22fd7b28a2f5d172e99dc06f20a6460ef7e2e1547bd4dbb10c" "b097e86d5a56fb34f8d7e7f10cdea34887e801c40152494e4fc54c1a3bfec49e" "7410d9a225a549456708673711a16e736d060e18145d31565f79658a331908ea" "c117c30db5c03f80d751b4237fefa19f289a89c064c16f2a71ace5b989bf2b12" "d997b3917b4929de98b0f1d0f1885a1e817b7167e722aac7c79a2f11f30ea476" "a1ab68e3fbfef75eb91b31e32170913f1c60a6e903d9057a51fee7c6395ed9a0" "b5715f89290691b507de6aa532b75db45ca1bd1e1b81a959bf3f225601d844e7" "6570843991e40121f854432826e9fd175aec6bd382ef217b2c0c46da37f3af18" "7a6936c94b90024f0cfa7c7579667093cda75a8f17761617c63ba80d6de6db33" "d552a89a5691c846c42efda2d9eca85b07375baf1a373a13cd3e2381affca692" "75a696bc7160537d6071073f50422d1db6315ea303d33d622dbf5d8d413add0f" "587d5e8ac355074b51471b7ecdf05213a33f40515fd5027e4796ea6370a7efa8" "555065b4cca21d27b1c799633e0e3cc7c02be5b19d93c1fcd6818e3f1ed08944" default)))
 '(default-input-method "rfc1345")
 '(display-time-mode t)
 '(global-font-lock-mode t)
 '(inhibit-startup-screen t)
 '(mouse-wheel-mode t)
 '(show-paren-mode t)
 ;; '(custom-enabled-themes (quote (philsf-ubuntu)))
 ;; '(custom-enabled-themes (quote (philsf-windows)))
 '(custom-enabled-themes (quote (philsf-global)))
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
 )
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
(setq TeX-auto-save t) 
(setq TeX-parse-self t) 
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

;; dvc Changelog entries (2013-12-12)
(setq user-mail-address "philsf79@gmail.com")  ;; default: user@host
(setq change-log-default-name "Changelog")   ;; default: ChangeLog

(require 'iso-transl)

;; Sentence-fill hack
;; ==================
;;
;; The macros here are based on emacs/23.3/lisp/textmodes/fill.el.gz.
;; To use them without modifying emacs, you can simply execute `cat
;; hack.el >> ~/.emacs` if you have downloaded this file (say, by
;; git).  Otherwise, you can use
;;
;; curl http://fermi.mycloudnas.com/cgit.cgi/fill/plain/hack.el >> ~/.emacs

(setq tex-mode-hook   '(lambda () (setq newline-after-sentence t)))
(setq latex-mode-hook '(lambda () (setq newline-after-sentence t)))

(defcustom newline-after-sentence nil
  "Non-nil means put a new line after each sentence."
  :type 'boolean
  :group 'fill)

(defun fill-one-line (from to justify)
  (goto-char from)
  (let (linebeg)
    (while (< (point) to)
      (setq linebeg (point))
      (move-to-column (current-fill-column))
      (if (when (< (point) to)
	    ;; Find the position where we'll break the line.
	    (forward-char 1) ;Use an immediately following space, if any.
	    (fill-move-to-break-point linebeg)
	    ;; Check again to see if we got to the end of
	    ;; the paragraph.
	    (skip-chars-forward " \t")
	    (< (point) to))
	  ;; Found a place to cut.
	  (progn
	    (fill-newline)
	    (when justify
	      ;; Justify the line just ended, if desired.
	      (save-excursion
		(forward-line -1)
		(justify-current-line justify nil t))))
	
	(goto-char to)
	;; Justify this last line, if desired.
	(if justify (justify-current-line justify t t))))))

(defun fill-region-as-paragraph (from to &optional justify
				      nosqueeze squeeze-after)
  "Fill the region as one paragraph.
It removes any paragraph breaks in the region and extra newlines at the end,
indents and fills lines between the margins given by the
`current-left-margin' and `current-fill-column' functions.
\(In most cases, the variable `fill-column' controls the width.)
It leaves point at the beginning of the line following the paragraph.

Normally performs justification according to the `current-justification'
function, but with a prefix arg, does full justification instead.

From a program, optional third arg JUSTIFY can specify any type of
justification.  Fourth arg NOSQUEEZE non-nil means not to make spaces
between words canonical before filling.  Fifth arg SQUEEZE-AFTER, if non-nil,
means don't canonicalize spaces before that position.

Return the `fill-prefix' used for filling.

If `sentence-end-double-space' is non-nil, then period followed by one
space does not end a sentence, so don't break a line there."
  (interactive (progn
		 (barf-if-buffer-read-only)
		 (list (region-beginning) (region-end)
		       (if current-prefix-arg 'full))))
  (unless (memq justify '(t nil none full center left right))
    (setq justify 'full))

  ;; Make sure "to" is the endpoint.
  (goto-char (min from to))
  (setq to   (max from to))
  ;; Ignore blank lines at beginning of region.
  (skip-chars-forward " \t\n")

  (let ((from-plus-indent (point))
	(oneleft nil))

    (beginning-of-line)
    ;; We used to round up to whole line, but that prevents us from
    ;; correctly handling filling of mixed code-and-comment where we do want
    ;; to fill the comment but not the code.  So only use (point) if it's
    ;; further than `from', which means that `from' is followed by some
    ;; number of empty lines.
    (setq from (max (point) from))

    ;; Delete all but one soft newline at end of region.
    ;; And leave TO before that one.
    (goto-char to)
    (while (and (> (point) from) (eq ?\n (char-after (1- (point)))))
      (if (and oneleft
	       (not (and use-hard-newlines
			 (get-text-property (1- (point)) 'hard))))
	  (delete-backward-char 1)
	(backward-char 1)
	(setq oneleft t)))
    (setq to (copy-marker (point) t))
    ;; ;; If there was no newline, and there is text in the paragraph, then
    ;; ;; create a newline.
    ;; (if (and (not oneleft) (> to from-plus-indent))
    ;; 	(newline))
    (goto-char from-plus-indent))

  (if (not (> to (point)))
      nil ;; There is no paragraph, only whitespace: exit now.

    (or justify (setq justify (current-justification)))

    ;; Don't let Adaptive Fill mode alter the fill prefix permanently.
    (let ((fill-prefix fill-prefix))
      ;; Figure out how this paragraph is indented, if desired.
      (when (and adaptive-fill-mode
		 (or (null fill-prefix) (string= fill-prefix "")))
	(setq fill-prefix (fill-context-prefix from to))
	;; Ignore a white-space only fill-prefix
	;; if we indent-according-to-mode.
	(when (and fill-prefix fill-indent-according-to-mode
		   (string-match "\\`[ \t]*\\'" fill-prefix))
	  (setq fill-prefix nil)))

      (goto-char from)
      (beginning-of-line)

      (if (not justify)	  ; filling disabled: just check indentation
	  (progn
	    (goto-char from)
	    (while (< (point) to)
	      (if (and (not (eolp))
		       (< (current-indentation) (current-left-margin)))
		  (fill-indent-to-left-margin))
	      (forward-line 1)))

	(if use-hard-newlines
	    (remove-list-of-text-properties from to '(hard)))
	;; Make sure first line is indented (at least) to left margin...
	(if (or (memq justify '(right center))
		(< (current-indentation) (current-left-margin)))
	    (fill-indent-to-left-margin))
	;; Delete the fill-prefix from every line.
	(fill-delete-prefix from to fill-prefix)
	(setq from (point))

	;; FROM, and point, are now before the text to fill,
	;; but after any fill prefix on the first line.
	(fill-delete-newlines from to justify nosqueeze squeeze-after)
	
	(if (not newline-after-sentence)
	    (fill-one-line from to justify) ;; original innner loop
	  
	  ;; Insert a line break after each sentence
	  (goto-char from)
	  (while (< (point) to)
	    (forward-sentence)
	    (if (< (point) to) (fill-newline)))
	  ;; This is the actual filling loop.
	  (goto-char from)
	  (let (sentbeg sentend)
	    (while (< (point) to)
	      (setq sentbeg (point))
	      (end-of-line)
	      (setq sentend (point))
	      (fill-one-line sentbeg sentend justify) ;; original innner loop
	      (forward-line)))))

      ;; Leave point after final newline.
      (goto-char to)
      (unless (eobp) (forward-char 1))
      ;; Return the fill-prefix we used
      fill-prefix)))

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

;; MELPA packages (2016-01-22)
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

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
