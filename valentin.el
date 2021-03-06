;; [[file:~/.emacs.d/valentin.org::*This%20is%20for%20org%20/repository/][This is for org /repository/:1]]
(add-to-list 'package-archives
	       '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives
		 '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; This is for org /repository/:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Which][Which:1]]
(use-package which-key
      :ensure t 
      :config
      (which-key-mode))
;; Which:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Swiper%20/IVY%20/%20Counsel][Swiper /IVY / Counsel:1]]
(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
  :map ivy-minibuffer-map
  ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))
;; Swiper /IVY / Counsel:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Spell%20Checker][Spell Checker:1]]
(use-package flyspell
  :ensure t
  :hook
  (text-mode . turn-on-flyspell)
  (prog-mode . flyspell-prog-mode)
  (org-mode . turn-on-flyspell))

(setq ispell-program-name "aspell")
 ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
;;(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")
;; Spell Checker:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Autocomplete][Autocomplete:1]]
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))
;; Autocomplete:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Autocomplete][Autocomplete:2]]
(use-package auto-complete
:ensure t
;:init
;(progn
;(ac-config-default)
;(global-auto-complete-mode t)
					;)
)

(setq py-python-command "python3")
(setq python-shell-interpreter "python3")
;; Autocomplete:2 ends here

;; [[file:~/.emacs.d/valentin.org::*Autocomplete][Autocomplete:3]]
;(use-package auto-complete-auctex
;  :ensure t)
(use-package ac-math
  :ensure t)

(add-to-list 'ac-modes 'latex-mode) ; beware of using 'LaTeX-mode instead
(defun my-ac-latex-mode () ; add ac-sources for latex
   (setq ac-sources
         (append '(ac-source-math-latex
           ac-source-latex-commands)
                 ac-sources)))
(add-hook 'LaTeX-mode-hook 'my-ac-latex-mode)
(setq ac-math-unicode-in-math-p nil)
(ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
(add-to-list 'ac-modes 'org-mode) ; auto-complete for org-mode (optional)
(require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
(ac-config-default)
(setq ac-auto-start t)            ; if t starts ac at startup automatically
(setq ac-auto-show-menu t)
(global-auto-complete-mode t)
;; Autocomplete:3 ends here

;; [[file:~/.emacs.d/valentin.org::*Start%20in%20fullscreen][Start in fullscreen:1]]
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
;; Start in fullscreen:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Aesthetics%20for%20getting%20rid%20of%20tool%20bar][Aesthetics for getting rid of tool bar:1]]
;; No toolbar, please.
(tool-bar-mode 0)
;; Or scroll bar.
(scroll-bar-mode 0)
;; Aesthetics for getting rid of tool bar:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Just%20for%20Mac][Just for Mac:1]]
(if (eq system-type 'darwin)
    (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
    (add-to-list 'default-frame-alist '(ns-appearance . light)))
;; Just for Mac:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Variable%20fonts][Variable fonts:1]]
(add-hook 'text-mode-hook 
	       (lambda ()
		(variable-pitch-mode 1)))
;; Variable fonts:1 ends here

;; [[file:~/.emacs.d/valentin.org::*For%20Linux][For Linux:1]]
(if (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil
			:family "Source Code Pro"
			:height 150))
(if (eq system-type 'gnu/linux)
    (set-face-attribute 'fixed-pitch nil
			:family "Source Code Pro"
			:height 140))
(if (eq system-type 'gnu/linux)
    (set-face-attribute 'variable-pitch nil
			:family "Source Code Pro"
			:height 150))
;; For Linux:1 ends here

;; [[file:~/.emacs.d/valentin.org::*For%20Mac][For Mac:1]]
(if (eq system-type 'darwin)
    (set-face-attribute 'default nil
			:family "Hasklig" :height 220))
(if (eq system-type 'darwin)
    (set-face-attribute 'fixed-pitch nil
			:family "Hasklig" :height 200))
(if (eq system-type 'darwin)
    (set-face-attribute 'variable-pitch nil
		      :family "Hasklig" :height 220))
;; For Mac:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Delete%20Highlighted%20text][Delete Highlighted text:1]]
(delete-selection-mode 1)
;; Delete Highlighted text:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Preview%20hex-colors][Preview hex-colors:1]]
(use-package rainbow-mode
  :ensure t)
;; Preview hex-colors:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Initialize%20stuff][Initialize stuff:1]]
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "<f5>") 'revert-buffer)
;; Initialize stuff:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Theme][Theme:1]]
(use-package doom-themes
  :custom-face
  (cursor ((t (:background "BlanchedAlmond"))))
  :config
  ;; flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  (load-theme 'doom-dark+ t))

(use-package doom-modeline
  :custom
  ;; Don't compact font caches during GC. Windows Laggy Issue
  (inhibit-compacting-font-caches t)
  (doom-modeline-minor-modes t)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-height 20)
  (doom-modeline-buffer-state-icon t)
  :config
  (doom-modeline-mode))
;; Theme:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Theme][Theme:2]]
(use-package all-the-icons
  :ensure t)
;; Theme:2 ends here

;; [[file:~/.emacs.d/valentin.org::*Theme][Theme:3]]
;(if (eq system-type 'gnu/linux)
;    (load-theme 'doom-peacock t))
;; Theme:3 ends here

;; [[file:~/.emacs.d/valentin.org::*Theme][Theme:4]]
;(if (eq system-type 'darwin)
;    (use-package circadian
;      :ensure t
;      :config
;      (setq circadian-themes '(("8:00" . leuven)
;			       ("18:00" . doom-peacock)))
;      (circadian-setup)))
;; Theme:4 ends here

;; [[file:~/.emacs.d/valentin.org::*Ace%20Windows][Ace Windows:1]]
(use-package ace-window
:ensure t
:init
(progn
(setq aw-scope 'global) ;; was frame
(global-set-key (kbd "C-x O") 'other-frame)
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
  ))
;; Ace Windows:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Numbers%20in%20all%20buffers][Numbers in all buffers:1]]
(global-linum-mode t)

					; nice formatting for numbers
(setq linum-format "%4d \u2502 ")
;; Numbers in all buffers:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Global%20text%20wrapping][Global text wrapping:1]]
(global-visual-line-mode t)
;; Global text wrapping:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Show%20and%20highlight%20parenthesis][Show and highlight parenthesis:1]]
(show-paren-mode 1)
(setq show-paren-delay 0)
;; Show and highlight parenthesis:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Show%20and%20highlight%20parenthesis][Show and highlight parenthesis:2]]
(use-package smartparens
  :diminish smartparens-mode
  :ensure t
  :config
  (setq
   sp-autoskip-closing-pair 'always
   sp-hybrid-kill-entire-symbol nil)
  (show-smartparens-global-mode +1)
  (smartparens-global-mode 1)
  ;; Fix usage of ' in Lisp modes
  ;; THANKS: https://github.com/Fuco1/smartparens/issues/286#issuecomment-32324743
  ;; (eval) is used as a hack to quiet Flycheck errors about (sp-with-modes)
  (eval
   '(sp-with-modes sp-lisp-modes
      ;; disable ', it's the quote character!
      (sp-local-pair "'" nil :actions nil)
      ;; also only use the pseudo-quote inside strings where it serve as
      ;; hyperlink.
      (sp-local-pair "`" "'" :when '(sp-in-string-p sp-in-comment-p))
      (sp-local-pair "`" nil
		     :skip-match (lambda (ms mb me)
				   (cond
				    ((equal ms "'")
				     (or (sp--org-skip-markup ms mb me)
					 (not (sp-point-in-string-or-comment))))
				    (t (not (sp-point-in-string-or-comment))))))))
  ;; Don't pair { in web-mode
  (eval
   '(sp-with-modes 'web-mode
      (sp-local-pair "\{" nil :actions nil))))
;; Show and highlight parenthesis:2 ends here

;; [[file:~/.emacs.d/valentin.org::*Show%20and%20highlight%20parenthesis][Show and highlight parenthesis:3]]
(use-package rainbow-delimiters
  :ensure t
  :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
;; Show and highlight parenthesis:3 ends here

;; [[file:~/.emacs.d/valentin.org::*Remap%20cmd%20key%20in%20Mac][Remap cmd key in Mac:1]]
;; remap command key to meta
;     (if (eq system-type 'darwin)
;	 (setq mac-command-modifier 'meta))
;; Remap cmd key in Mac:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Show%20greek%20letters%20in%20org%20mode][Show greek letters in org mode:1]]
(setq org-pretty-entitles t)
;; Show greek letters in org mode:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Show%20greek%20letters%20in%20org%20mode][Show greek letters in org mode:2]]
(defvar org-latex-fragment-last nil
  "Holds last fragment/environment you were on.")

(defun org-latex-fragment-toggle ()
  "Toggle a latex fragment image "
  (and (eq 'org-mode major-mode)
       (let* ((el (org-element-context))
	      (el-type (car el)))
	 (cond
	  ;; were on a fragment and now on a new fragment
	  ((and
	    ;; fragment we were on
	    org-latex-fragment-last
	    ;; and are on a fragment now
	    (or
	     (eq 'latex-fragment el-type)
	     (eq 'latex-environment el-type))
	    ;; but not on the last one this is a little tricky. as you edit the
	    ;; fragment, it is not equal to the last one. We use the begin
	    ;; property which is less likely to change for the comparison.
	    (not (= (org-element-property :begin el)
		    (org-element-property :begin org-latex-fragment-last))))
	   ;; go back to last one and put image back
	   (save-excursion
	     (goto-char (org-element-property :begin org-latex-fragment-last))
	     (org-preview-latex-fragment))
	   ;; now remove current image
	   (goto-char (org-element-property :begin el))
	   (let ((ov (loop for ov in org-latex-fragment-image-overlays
			   if
			   (and
			    (<= (overlay-start ov) (point))
			    (>= (overlay-end ov) (point)))
			   return ov)))
	     (when ov
	       (delete-overlay ov)))
	   ;; and save new fragment
	   (setq org-latex-fragment-last el))

	  ;; were on a fragment and now are not on a fragment
	  ((and
	    ;; not on a fragment now
	    (not (or
		  (eq 'latex-fragment el-type)
		  (eq 'latex-environment el-type)))
	    ;; but we were on one
	    org-latex-fragment-last)
	   ;; put image back on
	   (save-excursion
	     (goto-char (org-element-property :begin org-latex-fragment-last))
	     (org-preview-latex-fragment))
	   ;; unset last fragment
	   (setq org-latex-fragment-last nil))

	  ;; were not on a fragment, and now are
	  ((and
	    ;; we were not one one
	    (not org-latex-fragment-last)
	    ;; but now we are
	    (or
	     (eq 'latex-fragment el-type)
	     (eq 'latex-environment el-type)))
	   (goto-char (org-element-property :begin el))
	   ;; remove image
	   (let ((ov (loop for ov in org-latex-fragment-image-overlays
			   if
			   (and
			    (<= (overlay-start ov) (point))
			    (>= (overlay-end ov) (point)))
			   return ov)))
	     (when ov
	       (delete-overlay ov)))
	   (setq org-latex-fragment-last el))))))


(add-hook 'post-command-hook 'org-latex-fragment-toggle)
;; Show greek letters in org mode:2 ends here

;; [[file:~/.emacs.d/valentin.org::*Basic%20org][Basic org:1]]
(use-package org 
  :ensure t
  :pin org
  :config
  ;; Syntax highlight in #+BEGIN_SRC blocks
  (setq org-src-fontify-natively t)
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil))

(use-package org-babel-eval-in-repl
  :ensure t)
;; Basic org:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Basic%20org][Basic org:2]]
(use-package exec-path-from-shell
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (if (eq system-type 'darwin)
    (exec-path-from-shell-initialize)))
;; Basic org:2 ends here

;; [[file:~/.emacs.d/valentin.org::*Basic%20org][Basic org:3]]
(if (eq system-type 'gnu/linux)
    ;; PDFs visited in Org-mode are opened in Evince (and not in the default choice)
    (eval-after-load "org"
      '(progn
     ;; Change .pdf association directly within the alist
	 (setcdr (assoc "\\.pdf\\'" org-file-apps) "zathura %s"))))
;; Basic org:3 ends here

;; [[file:~/.emacs.d/valentin.org::*Org%20Bullets][Org Bullets:1]]
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; Org Bullets:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Management%20of%20references][Management of references:1]]
(use-package org-ref
  :after org
  :init
  (setq org-ref-default-bibliography '("~/Dropbox/galactica.bib"))
  ;; Next line is to change the search buffer from helm to ivy (prefer helm, if it works)
  (setq org-ref-completion-library 'org-ref-ivy-cite)
  (setq bibtex-completion-bibliography org-ref-default-bibliography))

(use-package doi-utils
  :after org)

(use-package org-ref-bibtex
  :after org)
;; Management of references:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Reveal.js%20for%20presentations%20in%20html][Reveal.js for presentations in html:1]]
(use-package org-re-reveal
  :ensure t
  :config
  (require 'ox-re-reveal)
  ;(setq org-re-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
  (setq org-re-reveal-root "https://revealjs.com/")
  (setq org-re-reveal-mathjax t)
  (setq org-re-reveal-highlight-css t)
)

(use-package htmlize
  :ensure t)
;; Reveal.js for presentations in html:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Support%20for%20ipython%20and%20jupyter%20notebooks][Support for ipython and jupyter notebooks:1]]
;; Ipython
(use-package ob-ipython
  :ensure t)
(require 'ob-ipython)

;; Jupyter notebooks
(use-package ein
  :ensure t)
(require 'ein)

(setq org-babel-python-command "python3")

(custom-set-variables
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pylint-executable "python3"))
;; Support for ipython and jupyter notebooks:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Exporting%20to%20LaTeX][Exporting to LaTeX:1]]
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; Exporting to LaTeX:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Exporting%20to%20LaTeX][Exporting to LaTeX:2]]
(setq org-latex-listings t)
(setq org-latex-listings 'minted)
(setq org-latex-minted-options
	   '(("frame" "lines")
	     ;("fontsize" "\\scriptsize")
	     ("numbers" "both")
	     ("mathescape")
	     ("breaklines" "true")
	     ("breakanywhere" "true")
	     ("style" "tango")))
;; Exporting to LaTeX:2 ends here

;; [[file:~/.emacs.d/valentin.org::*Exporting%20to%20LaTeX][Exporting to LaTeX:3]]
(add-to-list 'org-latex-classes
      '("exam"
	 "\\documentclass{exam}
	 [NO-DEFAULT-PACKAGES]
	 [PACKAGES]
	 [EXTRA]"
	 ("\\section{%s}" . "\\section*{%s}")
	 ("\\subsection{%s}" . "\\subsection*{%s}")
	 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	 ("\\paragraph{%s}" . "\\paragraph*{%s}")
	 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; Exporting to LaTeX:3 ends here

;; [[file:~/.emacs.d/valentin.org::*Exporting%20to%20LaTeX][Exporting to LaTeX:4]]
(setq org-latex-with-hyperref nil)
;; Exporting to LaTeX:4 ends here

;; [[file:~/.emacs.d/valentin.org::*CV%20in%20org][CV in org:1]]
(use-package ox-moderncv
    :load-path "~/.emacs.d/org-cv/"
    :init (require 'ox-moderncv))
;; CV in org:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Literate%20programming%20(ipython)][Literate programming (ipython):1]]
(require 'ob-ipython)
;; Literate programming (ipython):1 ends here

;; [[file:~/.emacs.d/valentin.org::*Load%20all%20the%20languages%20in%20org][Load all the languages in org:1]]
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (latex . t)
   (R . t)
   (ein . t)
   (css . t)
   (matlab . t)
   (octave . t)
   (shell . t)
   (ipython . t)
   (fortran . t)
   (gnuplot . t)
   (java . t)
   (C . t)))
;; Load all the languages in org:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Load%20all%20the%20languages%20in%20org][Load all the languages in org:2]]
;; to use R kernel on ein chunks
 (ein:org-register-lang-mode "ein-R" 'R)
;; Load all the languages in org:2 ends here

;; [[file:~/.emacs.d/valentin.org::*Source%20blocks%20are%20not%20indented%20(mostly%20for%20python)][Source blocks are not indented (mostly for python):1]]
(setq org-edit-src-content-indentation 0
      org-src-preserve-indentation t)
;; Source blocks are not indented (mostly for python):1 ends here

;; [[file:~/.emacs.d/valentin.org::*Elpy%20(should%20do%20most%20of%20the%20work)][Elpy (should do most of the work):1]]
(use-package elpy
  :ensure t
  :init 
  (elpy-enable))

(setq elpy-rpc-python-command "python3")

(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")
;; Elpy (should do most of the work):1 ends here

;; [[file:~/.emacs.d/valentin.org::*Flycheck%20for%20autocompletion][Flycheck for autocompletion:1]]
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;; Flycheck for autocompletion:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Some%20other%20stuff%20to%20use%20Python%203][Some other stuff to use Python 3:1]]
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
(setq flycheck-python-pycompile-executable "python3")
;; Some other stuff to use Python 3:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Some%20other%20stuff%20to%20use%20Python%203][Some other stuff to use Python 3:2]]
(defvar doom-modeline-python-executable "python"
  "What executable of Python will be used (if nil nothing will be showed).")

(setq doom-modeline-python-executable "python3")
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
(setq flycheck-python-pycompile-executable "python3"
      flycheck-python-pylint-executable "python3"
      flycheck-python-flake8-executable "python3")
(setq doom-modeline-major-mode-icon nil
      doom-modeline-persp-name t
      doom-modeline-github t
      doom-modeline-version t
      doom-modeline-minor-modes t)
;(minions-mode 1)
;(setq persp-nil-name "#")
;(setq minions-mode-line-lighter "◎")

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
	  (python-shell-completion-native-output-timeout
	   python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(setq python-shell-completion-native-disabled-interpreters '("python"))
;; Some other stuff to use Python 3:2 ends here

;; [[file:~/.emacs.d/valentin.org::*LaTeX][LaTeX:1]]
(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-parse-self t)
  ;; Here we make auctex aware of latexmk and xelatexmk. We can use
  ;; these instead of calling pdflatex, bibtex, pdflatex, pdflatex (or
  ;; similar). I'll set latexmk as the default as there's really no
  ;; reason to use pdflatex
  (eval-after-load "tex"
    '(add-to-list 'TeX-command-list '("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk")))
  (eval-after-load "tex"
    '(add-to-list 'TeX-command-list '("xelatexmk" "latexmk -synctex=1 -shell-escape -xelatex %s" TeX-run-TeX nil t :help "Process file with xelatexmk")))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk"))))
;; LaTeX:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Yasnippet][Yasnippet:1]]
(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))
;; Yasnippet:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Yasnippet][Yasnippet:2]]
(add-hook 'org-mode-hook 'yas-minor-mode)
(add-hook 'latex-mode-hook 'yas-minor-mode)
(add-hook 'f90-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'c++-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)
(add-hook 'r-mode-hook 'yas-minor-mode)
(add-hook 'ess-mode-hook 'yas-minor-mode)
;; Yasnippet:2 ends here

;; [[file:~/.emacs.d/valentin.org::*Only%20for%20R%20stuff][Only for R stuff:1]]
(use-package ess-site
  :ensure ess
  :demand t
  :if
  (eq system-type 'darwin)
  :config
  ;; Don't hog Emacs when submitting long-running code
  (setq ess-eval-visibly 'nowait))
;; Only for R stuff:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Magit][Magit:1]]
(use-package magit
  :ensure t
  :init
  (progn
  (bind-key "C-x g" 'magit-status)
  ))
;; Magit:1 ends here

;; [[file:~/.emacs.d/valentin.org::*Fortran][Fortran:1]]
(autoload 'f90-mode "f90" "Fortran 90 mode" t)
(add-hook 'f90-mode-hook 'my-f90-mode-hook)

(defun my-f90-mode-hook ()
  (setq f90-font-lock-keywords f90-font-lock-keywords-3)
  (abbrev-mode 1)                       ; turn on abbreviation mode
  (turn-on-font-lock)                   ; syntax highlighting
  (auto-fill-mode 0))                   ; turn off auto-filling
;; Fortran:1 ends here

;; [[file:~/.emacs.d/valentin.org::*How%20long%20did%20Emacs%20take%20to%20load?][How long did Emacs take to load?:1]]
(defconst emacs-start-time (current-time))

(let ((elapsed (float-time (time-subtract (current-time)
					  emacs-start-time))))
  (message "[STARTUP] Loading %s ... done (%.3fs)" load-file-name elapsed))
;; How long did Emacs take to load?:1 ends here
