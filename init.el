;; THEME AND GLOBALS
(setq inhibit-startup-message t)
(load-theme 'tsdh-dark)
(global-set-key (kbd "C-z") 'undo)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq-default show-trailing-whitespace t)

;; Remove backup files (*~)

(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
;; remove lock files (issues with npm)
(setq create-lockfiles nil)

;; (add-hook 'after-init-hook #'global-flycheck-mode)

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

;; COPILOT

;; COMPANY

(straight-use-package 'company)

;; WEB (TYPESCRIPT)

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
;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; if you use treesitter based typescript-ts-mode (emacs 29+)
;; (add-hook 'typescript-ts-mode-hook #'setup-tide-mode)

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
(global-set-key (kbd "C-c C-p p") 'treemacs-projectile)

;; Magit
(straight-use-package 'magit)
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

;; (elpy-enable)

;; DIRENV MODE

(straight-use-package 'direnv)
(direnv-mode)

;; YASNIPPET

(straight-use-package 'yasnippet)
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
