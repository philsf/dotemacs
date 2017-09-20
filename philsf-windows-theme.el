(deftheme philsf-windows
  "Created 2016-08-23.")

(custom-theme-set-variables
 'philsf-windows
)

(custom-theme-set-faces
 'philsf-windows
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

(add-hook 'after-init-hook (lambda () (load-theme 'zerodark)))

(provide-theme 'philsf-windows)
