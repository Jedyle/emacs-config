# Install

1. Install emacs
2. Clone this github repository into .emacs.d/

This will install all the required packages

3. If you need to create some custom config for your current environment, create a custom.el file and add your config here.
Example (needed to increase the font size for my small laptop)

```custom.el
(set-face-attribute 'default nil :height 140)
```

Some pre-made files will be available (ex: thinkpad-yogax1.el)

# GPT.el

Create a file named .gptkey in this directory, containing the openAI key

# Install new package

My package manager is straight.el
```
(straight-use-package 'packagename)
```

Commit the changes

## Cheat Sheet

Straight.el
reload lock file : M-x straight-thaw-versions

Debugging a Lisp error
M-x toogle-debug-on-error

Find a command for an existing shortcut
C-h k
