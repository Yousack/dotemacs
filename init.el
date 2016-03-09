(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; exterior
(global-linum-mode)
(electric-indent-mode -1)
(load-theme 'molokai t)
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "Hiragino Kaku Gothic ProN"))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(setq-default indent-tabs-mode nil)
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style '(face trailing empty))
(setq whitespace-action '(auto-cleanup))

;; interior
(setq make-backup-files nil)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; helm
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
(defvar helm-M-x-fuzzy-match t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; utils
(require 'smartparens-config)
(smartparens-global-mode t)
(smartparens-strict-mode 1)
(exec-path-from-shell-initialize)
(require 'company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Python
(pyenv-mode)
(add-hook 'python-mode-hook 'anaconda-mode)

;; D
(require 'company-dcd)
(add-hook 'd-mode-hook 'company-dcd-mode)
(add-hook 'd-mode-hook #'smartparens-strict-mode)
(add-hook 'd-mode-hook 'flycheck-dmd-dub-set-variables)
(add-hook 'd-mode-hook
          '(lambda ()
             (setq c-default-style "k&r")
             (setq c-basic-offset 4)
             (setq c-auto-newline t)
             (setq tab-width 4)
             (setq c-hungry-delete-key t)))

;; Org
(require 'org)
(setq org-src-fontify-natively t)
(require 'ox-latex)
(require 'ox-bibtex)
(require 'ox-md)
(setq org-latex-packages-alist
      '(
        ("" "bm")
        ("" "url")
        ))
(setq org-latex-classes
      '(("ltjsarticle"
         "\\documentclass{ltjsarticle}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ("ltjsarticle_two"
         "\\documentclass[twocolumn]{ltjsarticle}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ("beamer"
         "\\documentclass[presentation,dvipdfmx]{beamer}
\\usefonttheme{professionalfonts}
\\setbeamertemplate{bibliography item}{\\insertbiblabel}
\\setbeamertemplate{footline}[frame number]
\\setbeamertemplate{caption}[numbered]
\\beamertemplatenavigationsymbolsempty"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
        ("ltjbook"
         "\\documentclass{ltjbook}"
         ("\\part{%s}" . "\\part{%s}")
         ("\\chapter{%s}" . "\\chapter{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
(setq org-latex-pdf-process '("latexmk %f"))
(setq org-latex-default-class "ltjsarticle")
