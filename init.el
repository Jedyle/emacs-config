;; THEME AND GLOBALS
(setq inhibit-startup-message t)
(load-theme 'tsdh-dark)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-p") 'ace-window)

;; Marking text
(delete-selection-mode t)
(transient-mark-mode t)

;; Remove backup files (*~)

(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
;; remove lock files (issues with npm)
(setq create-lockfiles nil)

;; PACKAGES
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(terraform-mode hcl-mode dockerfile-mode multiple-cursors helm-projectile treemacs-magit treemacs-projectile projectile magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; PROJECTILE

(projectile-mode +1)
(setq projectile-indexing-method 'native)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(defvar projectile-globally-ignored-directories)
(add-to-list 'projectile-globally-ignored-directories "*/node_modules")

;; TREEMACS3
(global-set-key (kbd "M-t") 'treemacs)
(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-c C-p p") 'treemacs-projectile)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; MULTIPLE CURSORS

(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-all-like-this)

;; ELECTRIC PAIR MODE
(electric-pair-mode 1)

