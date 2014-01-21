emacs-mtgox
===========

Simple Emacs extension to display current Mtgox average
price on the mode-line


Installation
============

* (Pending marmalade package)

# Download `mtgox.el` file and place in directory inside your load-path
# Your .emacs file should looks like:

```
(require 'mtgox)

;;Optional: You can setup the fetch interval
;;default: 10 secs
(setq mtgox-api-poll-interval 10)

;;Start
(mtgox-start)
```
