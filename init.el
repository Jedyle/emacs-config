

;; THEME AND GLOBALS
(setq inhibit-startup-message t)
(load-theme 'tsdh-dark)
(global-set-key (kbd "C-z") 'undo)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Marking text
(delete-selection-mode t)
(transient-mark-mode t)

;; Show trailing whitespace, except in term-mode
(setq-default show-trailing-whitespace t)
(add-hook 'term-mode-hook (lambda () (setq show-trailing-whitespace nil)))
;; also don't show it when R console is open
(add-hook 'inferior-ess-mode-hook (lambda () (setq show-trailing-whitespace nil)))

;; Remove backup files (*~)

(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
;; remove lock files (issues with npm)
(setq create-lockfiles nil)

;; STRAIGHT.EL (package manager)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; USE PACKAGE
(straight-use-package 'use-package)

;; FLYCHECK
(use-package flycheck
  :straight t
  :ensure t
  :init (global-flycheck-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-python-flake8-executable "~/.local/bin/flake8")

;; COPILOT

;; you can utilize :map :hook and :config to customize copilot

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)
;; you can utilize :map :hook and :config to customize copilot

(add-hook 'prog-mode-hook 'copilot-mode)

;; Bind copilot-accept-completion to <tab> in copilot-mode
(define-key copilot-completion-map (kbd "<backtab>") 'copilot-accept-completion)

(add-to-list 'copilot-major-mode-alist '("docker-compose" . "dockercompose"))

;; defaults 'copilot-indentation-alist for emacs lisp
;; (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode . 2))

;; disable copilot-mode for R files

(add-hook 'ess-mode-hook (lambda () (copilot-mode -1)))

;; Disable copilot mode indentation warning for emacs lisp
(setq copilot-indent-offset-warning-disable t)

;; you can utilize :map :hook and :config to customize copilot

;; Markdown

(straight-use-package 'markdown-mode)

;; DEVOPS

;; Install terraform-mode, yaml-mode, dockerfile-mode, json-mode, markdown-mode with straight.el
(straight-use-package 'terraform-mode)
(add-to-list 'exec-path "~/.tfenv/bin")
(setq terraform-format-on-save t)

(straight-use-package 'yaml-mode)
(straight-use-package 'docker-compose-mode)
(straight-use-package 'dockerfile-mode)
(straight-use-package 'json-mode)

;; COMPANY

(straight-use-package 'company)

;; ACE WINDOW

(straight-use-package 'ace-window)

(global-set-key (kbd "M-p") 'ace-window)
(defvar aw-dispatch-alist
  '((?d aw-delete-window "Delete Window")
    (?m aw-swap-window "Swap Windows")
    (?M aw-move-window "Move Window")
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

(global-set-key (kbd "M-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>")  'shrink-window)
(global-set-key (kbd "M-<up>")    'enlarge-window)

;; Always dispatch
;; (setq aw-dispatch-always t)

;; Completion
(global-set-key (kbd "C-:") 'dabbrev-expand)
(global-set-key (kbd "C-M-:") 'dabbrev-completion)

;; PROJECTILE

(straight-use-package 'projectile)
(straight-use-package 'helm-projectile)
(projectile-mode +1)
(setq projectile-indexing-method 'native)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(defvar projectile-globally-ignored-directories)
(add-to-list 'projectile-globally-ignored-directories "*/node_modules")

;; TREEMACS3
(straight-use-package 'treemacs)
(straight-use-package 'treemacs-projectile)
(global-set-key (kbd "M-t") 'treemacs)

(global-set-key (kbd "M-0") 'treemacs-select-window)
;; Equivalent to M-0 for keyboard without numpad
(global-set-key (kbd "M-à") 'treemacs-select-window)

(global-set-key (kbd "C-c C-p p") 'treemacs-projectile)

;; Magit
;; Pinned to 3.3.0, because latest versions are broken with emacs 27
(straight-use-package
 '(magit :type git :host github :repo "magit/magit" :commit "f44f6c14"))
(global-set-key (kbd "C-x g") 'magit-status)

;; MULTIPLE CURSORS

(straight-use-package 'multiple-cursors)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ELECTRIC PAIR MODE

(electric-pair-mode 1)

;; ELPY

(straight-use-package 'elpy)
(elpy-enable)
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-black-fix-code nil t)))

;; DIRENV MODE

(straight-use-package 'direnv)
(direnv-mode)

;; YASNIPPET

(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(yas-global-mode 1)

;; GPT EL - ChatGPT

(straight-use-package 'gptel)

(defun read-gptkey-file ()
  "Read the content of `.gptkey' file in `~/.emacs.d/'."
  (with-temp-buffer
    (insert-file-contents (expand-file-name ".gptkey" (concat user-emacs-directory)))
    (buffer-string)))
(setq gptel-api-key (read-gptkey-file))
(setq gptel-model "gpt-3.5-turbo")

;; WEB (TYPESCRIPT)

(straight-use-package 'web-mode)
(straight-use-package 'typescript-mode)

(straight-use-package 'tide)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

;; if you use typescript-mode
(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; if you use treesitter based typescript-ts-mode (emacs 29+)
;; (add-hook 'typescript-ts-mode-hook #'setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; Groovy Mode
(straight-use-package 'groovy-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-syntax-check-command "~/.local/bin/flake8")
 '(flycheck-lintr-linters "linters_with_defaults(indentation_linter(indent = 4L))"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; PHP Mode
(straight-use-package 'php-mode)

;; R mode
(straight-use-package 'ess)
(setq ess-use-flymake nil)


;; Split window vertically when opening R console
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)
(defun my-open-r-console-vertical ()
  (interactive)
  (split-window-right)
  (R)
  )


(global-set-key (kbd "C-c r") 'my-open-r-console-vertical)


;; Load custom.el if it exists

(load "~/.emacs.d/custom.el" t)
