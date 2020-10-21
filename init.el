(require 'cl)

;; LOCAL VARIABLES

(setq custom-elpy-venv "/home/dev1/Mindee/Envs/elpy-rpc-venv")
(setq custom-org-dir "~/org/")
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
 '(org-capture-templates
   (quote
    (("a" "Architecture entry" entry
      (file+olp (concat custom-org-dir "organizer.org") "Projects" "Architecture")
      "* TODO")
     ("i" "Inbox entry" entry
      (file+headline (concat custom-org-dir "organizer.org") "Inbox")
      "* NOTE :")
     ("d" "Add TODO for Deployments" entry
      (file+olp (concat custom-org-dir "organizer.org") "Projects" "Deployment")
      "* TODO "))))
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
(setq org-log-done t)

(defun gtd ()
  (interactive)
  (find-file "~/org/organizer.org")
  )

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list (concat custom-org-dir "organizer.org")))

;; EMOJIFY

(add-hook 'after-init-hook 'emojify-mode)

;; GO MODE

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
