;; Increase font size for better readability
(set-face-attribute 'default nil :height 140)
;; but not for treemacs window
(add-hook 'treemacs-mode-hook (lambda () (text-scale-set -1)))


;; Bind keys for laptop without numpad
(setq aw-keys '(?a ?s ?x ?f ?g ?h ?j ?k ?l))
