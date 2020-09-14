;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vikke Tiirola"
      user-mail-address "vikke.tiirola@gmail.com"
      doom-font (font-spec :family "JetBrains Mono" :size 14)
      ;;doom-theme 'doom-one-light
      doom-theme 'doom-gruvbox
      display-line-numbers-type t
      org-directory "~/org/"
      projectile-project-search-path '("~/own/" "~/uni/" "~/own/practice"))

(after! org
  (setq org-log-into-drawer t
        org-todo-keywords '((sequence "TODO(t)" "WAIT(w!)" "|" "DONE(d!)" "CANCELLED(c!)"))
        org-agenda-custom-commands
        '(("x" "Agenda, TODAY and NEXT"
           ((agenda "")
            (tags "today" )
            (tags "next"))))
        org-tag-alist '(("today" . ?t) ("next" . ?n))
        org-fast-tag-selection-single-key t
        org-hide-emphasis-markers t
        org-startup-folded 'content
        ;;org-show-context-detail '(agenda . ancestors)
        )
  )

;; Latex configs
(setq pdf-latex-command "latexmk"
      +latex-viewers '(zathura))

(custom-set-faces!
  '(outline-1 :height 1.20)
  '(outline-2 :height 1.08 :foreground "orange"))

;; Custom mappings
(map! :mode org-mode
      :n "C-t" 'org-todo
      :n "g l" 'org-down-element)

(map! :mode org-agenda-mode
      :n "C-t" 'org-todo)

(map! :i "C-å" 'evil-normal-state)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
