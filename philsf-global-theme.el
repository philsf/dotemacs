(deftheme philsf-global
  "Created 2016-08-23.")

(custom-theme-set-variables
 'philsf-global
 '(inhibit-startup-screen t)
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(display-time-mode t)
 '(global-font-lock-mode t)
 '(mouse-wheel-mode t)
 '(show-paren-mode t))

;; (custom-theme-set-faces
;;  'philsf-global
;;  )

(add-hook 'after-init-hook (lambda () (load-theme 'zerodark)))

(provide-theme 'philsf-global)
