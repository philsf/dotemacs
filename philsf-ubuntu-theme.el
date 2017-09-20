(deftheme philsf-ubuntu
  "Created 2016-08-04.")

(custom-theme-set-variables
 'philsf-ubuntu
 )

(custom-theme-set-faces
 'philsf-ubuntu
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 120 :width normal)))))

;; (add-hook 'after-init-hook (lambda () (load-theme 'philsf-global)))
(add-hook 'after-init-hook (lambda () (load-theme 'zerodark)))

(provide-theme 'philsf-ubuntu)
