# Install

1. Install emacs
2. Clone this github repository into .emacs.d/

This will install all the required packages

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
