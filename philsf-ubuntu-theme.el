(deftheme philsf-ubuntu
  "Created 2016-08-04.")

(custom-theme-set-variables
 'philsf-ubuntu
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(inhibit-startup-screen t)
 '(display-time-mode t)
 '(global-font-lock-mode t)
 '(mouse-wheel-mode t)
 '(show-paren-mode t))

(custom-theme-set-faces
 'philsf-ubuntu
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 120 :width normal)))))

(provide-theme 'philsf-ubuntu)
