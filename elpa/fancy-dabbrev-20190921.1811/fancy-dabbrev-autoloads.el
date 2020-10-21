;;; fancy-dabbrev-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "fancy-dabbrev" "fancy-dabbrev.el" (23950 284
;;;;;;  522584 14000))
;;; Generated autoloads from fancy-dabbrev.el

(autoload 'fancy-dabbrev-expand "fancy-dabbrev" "\
Expand previous word \"dynamically\", potentially with a popup menu.

This function executes `dabbrev-expand' when called the first
time. Seqsequent calls will execute `dabbrev-expand' while
showing a popup menu with the expansion candidates.

\(fn)" t nil)

(autoload 'fancy-dabbrev-expand-or-indent "fancy-dabbrev" "\
Expand previous word \"dynamically\" or indent.

This function executes `fancy-dabbrev-expand' if the cursor is
after an expandable prefix, otherwise `indent-for-tab-command'.

\(fn)" t nil)

(autoload 'fancy-dabbrev-backward "fancy-dabbrev" "\
Select the previous expansion candidate.

If run after `fancy-dabbrev-expand', this function selects the
previous expansion candidate in the menu.

\(fn)" t nil)

(autoload 'fancy-dabbrev-mode "fancy-dabbrev" "\
Toggle fancy-dabbrev-mode.

With a prefix argument ARG, enable fancy-dabbrev-mode if ARG is
positive, and disable it otherwise. If called from Lisp, enable
the mode if ARG is omitted or nil.

When fancy-dabbrev-mode is enabled, fancy-dabbrev's preview
functionality is activated.

\(fn &optional ARG)" t nil)

(defvar global-fancy-dabbrev-mode nil "\
Non-nil if Global Fancy-Dabbrev mode is enabled.
See the `global-fancy-dabbrev-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-fancy-dabbrev-mode'.")

(custom-autoload 'global-fancy-dabbrev-mode "fancy-dabbrev" nil)

(autoload 'global-fancy-dabbrev-mode "fancy-dabbrev" "\
Toggle Fancy-Dabbrev mode in all buffers.
With prefix ARG, enable Global Fancy-Dabbrev mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Fancy-Dabbrev mode is enabled in all buffers where
`(lambda nil (fancy-dabbrev-mode 1))' would do it.
See `fancy-dabbrev-mode' for more information on Fancy-Dabbrev mode.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; fancy-dabbrev-autoloads.el ends here
