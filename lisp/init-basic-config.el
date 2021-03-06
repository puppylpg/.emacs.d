;; about TAB
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;;show paren
(show-paren-mode t)

(setq require-final-newline t)

;; gtags-mode
(autoload 'gtags-mode "gtags" " " t)
(gtags-mode 1)
(define-key gtags-mode-map (kbd "M-.") 'gtags-find-tag-from-here)
(define-key gtags-mode-map (kbd "M-*") 'gtags-pop-stack)

;;-----------------------------------------------
;; Disable tool-bar and scroll-bar
;;-----------------------------------------------
(tool-bar-mode 0)
(scroll-bar-mode 0)

;;-----------------------------------------------
;; File preprocess
;;-----------------------------------------------
(defun indent-whole-buffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (untabify (point-min) (point-max))
  )
;; (add-hook 'before-save-hook 'indent-whole-buffer)
;; indent the whole buffer befor saving the buffer

(provide 'init-basic-config)
