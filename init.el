;; This is the initial setup. It is needed in order to load the fundamrntal packages.
;;Afterwards, everything will be loaded from the org file.



(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; for the use-package package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(doc-view-continuous t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files
   (quote
    ("~/Documents/SUBMISSIONS/CSSSA2019/final_submission/csssa2019_valentin-amira.org")))
 '(package-selected-packages
   (quote
    (gnuplot circadian magit auctex org-ref exec-path-from-shell flycheck elpy ein ob-ipython org-re-reveal org-tempo ox-reveal org-babel-eval-in-repl swiper ivy counsel which-key use-package try org-bullets ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))


;; This loads the org file with the code.
(org-babel-load-file (expand-file-name "~/.emacs.d/valentin.org"))




