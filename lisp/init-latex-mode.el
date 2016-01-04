(require-package 'auctex)

(defun my-LaTeX-mode ()
     (list 'auto-fill-mode
           'LaTeX-math-mode
           'turn-on-reftex
           'linum-mode)
     (setq TeX-auto-untabify t     ; remove all tabs before saving
           TeX-engine 'xetex       ; use xelatex default
           TeX-show-compilation t) ; display compilation windows
     (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
     (imenu-add-menubar-index)
     (setq TeX-save-query nil)
  )

(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode)

(setq TeX-view-program-list
      '(("SumatraPDF" "SumatraPDF.exe %o")
        ("Gsview" "gsview32.exe %o")
        ("Okular" "okular --unique %o")
        ("Evince" "evince %o")
        ("Firefox" "firefox %o")))
(cond
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                 (output-dvi "Yap"))))))

 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "Okular")
                                                 (output-dvi "Okular")))))))

(provide 'init-latex-mode)
