(require 'cl)

;; LOCAL VARIABLES

(setq custom-elpy-venv "/home/dev1/Mindee/Envs/elpy-rpc-venv")
(setq custom-org-dir "~/Perso/Org/")
(setq custom-workon-home "~/Mindee/Envs")

;; BASIC

(setq inhibit-startup-message t)
;; hide the startup message

;; THEME

(load-theme 'tsdh-dark)

;; Shortcuts

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-p") 'ace-window)

;; Aliases

(defalias 'yes-or-no-p 'y-or-n-p)

;; Remove backup files (*~)

(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Marking text

(delete-selection-mode t)
(transient-mark-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(elpy-rpc-virtualenv-path custom-elpy-venv)
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("w" "Agenda and all TODOs related to work"
      ((agenda ""
	       ((org-agenda-tag-filter-preset
		 (quote
		  ("+@work")))))
       (alltodo ""
		((org-agenda-tag-filter-preset
		  (quote
		   ("+@work"))))))
      nil nil))))
 '(org-agenda-files (quote ("~/Perso/Org/work.org")))
 '(package-selected-packages
   (quote
    (go-mode emojify magit feature-mode gherkin-mode nginx-mode markdown-mode fancy-dabbrev groovy-mode jenkins dockerfile-mode resize-window yasnippet-snippets gnu-elpa-keyring-update multiple-cursors elpy company-terraform terraform-mode docker-compose-mode treemacs-projectile treemacs flycheck jedi use-package helm-projectile projectile ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "gray" :distant-foreground "gtk_selection_fg_color")))))



;; Trailing Newline

(setq require-final-newline t)

;; ELPA, MELPA

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(defvar aw-dispatch-alist
  '((?d aw-delete-window "Delete Window")
    (?s aw-swap-window "Swap Windows")
    (?m aw-move-window "Move Window")
    (?c aw-copy-window "Copy Window")
    (?j aw-switch-buffer-in-window "Select Buffer")
    (?n aw-flip-window)
    (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
    (?c aw-split-window-fair "Split Fair Window")
    (?v aw-split-window-vert "Split Vert Window")
    (?b aw-split-window-horz "Split Horz Window")
    (?o delete-other-windows "Delete Other Windows")
    (?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.")


;; PROJECTILE

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; TREEMACS
(global-set-key (kbd "M-t") 'treemacs)
(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-c C-p p") 'treemacs-projectile)

;; MULTIPLE CURSORS
(global-set-key (kbd "C-c C-!") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ELPY

(setenv "WORKON_HOME" custom-workon-home)
(setq elpy-rpc-python-command "python3.6")
(elpy-enable)

; automatically format python code on save
;; (add-hook 'elpy-mode-hook
;; 	  '(lambda ()
;; 	     (when (eq major-mode 'python-mode)
;; 	       (add-hook 'before-save-hook 'elpy-black-fix-code))))

;; FLYMAKE

;; Nope, I want my copies in the system temp dir.
(setq flymake-run-in-place nil)
;; This lets me say where my temp dir is.
(setq temporary-file-directory "~/.emacs.d/tmp/")

;; DOCKER

(require 'yaml-mode)
(require 'docker-compose-mode)

;; YASNIPPETS

(yas-global-mode 1)

;; RESIZE WINDOW

(require 'resize-window)
(push '(?o ?n) resize-window-alias-list)
(push '(?l ?p) resize-window-alias-list)
(push '(?m ?f) resize-window-alias-list)
(push '(?k ?b) resize-window-alias-list)

;; ELECTRIC PAIR

(electric-pair-mode 1)

(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\{ . ?\})))


;; DABBREV

(global-set-key (kbd "C-:") 'dabbrev-expand)
(global-set-key (kbd "C-M-:") 'dabbrev-completion)

;; DOCKERFILE MODE

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; JENKINSFILE MODE

(add-to-list 'load-path "~/.emacs.d/jenkinsfile-mode")
(require 'jenkinsfile-mode)
(add-to-list 'auto-mode-alist '("Jenkinsfile\\'" . jenkinsfile-mode))

;; DABBREV

(setq dabbrev-case-distinction nil)
(setq dabbrev-case-fold-search t)
(setq dabbrev-case-replace nil)

;; MAGIT

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

;; ORG-MODE

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list custom-org-dir))
(setq org-tag-alist '(("@WORK" . ?w) ("@PERSO" . ?p)))                

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)|" "CANCELLED(c@/!)" "PHONE(p)" "MEETING(m)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "orange red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq custom-capture-file (concat custom-org-dir "capture/capture.org"))
(setq custom-journal-file (concat custom-org-dir "journal.org"))

(setq org-capture-templates
      (quote (("t" "todo" entry (file custom-capture-file)
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("n" "note" entry (file custom-capture-file)
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree custom-journal-file)
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file custom-capture-file)
               "* TODO Review %c\n%U\n" :immediate-finish t)
	      )))

;; REFILING


; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
;; ; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

;;; Disable key bindings that adds org file to an agenda (we do it manually instead)
(define-key org-mode-map (kbd "C-c [") nil)
(define-key org-mode-map (kbd "C-c ]") nil)

;; EMOJIFY

(add-hook 'after-init-hook 'emojify-mode)

;; GO MODE

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
