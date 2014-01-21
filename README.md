emacs-mtgox
===========

Simple Emacs extension to display current Mtgox average
price on the mode-line

![Screenshot](https://github.com/niedbalski/emacs-mtgox/blob/master/screenshot.png?raw=true)

Installation
============

1. Download `mtgox.el` file and place in directory inside your load-path
2. Your .emacs file should looks like:

```lisp
(require 'mtgox)

;;Optional: You can setup the fetch interval
;;default: 10 secs
(setq mtgox-api-poll-interval 10)

;;Start
(mtgox-start)
```
