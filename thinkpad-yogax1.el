;; Increase font size for better readability
(set-face-attribute 'default nil :height 140)
;; but not for treemacs window
(add-hook 'treemacs-mode-hook (lambda () (text-scale-set -1)))

;; Bind keys for laptop without numpad
(setq aw-keys '(?a ?s ?x ?f ?g ?h ?j ?k ?l))

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
;; disable copilot-mode for R files
(add-hook 'ess-mode-hook (lambda () (copilot-mode -1)))
;; Disable copilot mode indentation warning for emacs lisp
(setq copilot-indent-offset-warning-disable t)
