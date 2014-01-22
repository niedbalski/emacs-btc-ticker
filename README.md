Emacs-MTGox
===========

Simple Emacs minor-mode to display current Mtgox average
price on the mode-line

![Screenshot](https://github.com/niedbalski/emacs-mtgox/blob/master/screenshot.png?raw=true)

Installation
============

1. Install via `package-list-packages` and install ***mtgox*** package from melpa.
2. Or you can download the file `mtgox.el` and place inside your load-path.

Usage
=====

Your .emacs file should looks like:

```lisp
(require 'mtgox)

;;Optional: You can setup the fetch interval
;;default: 10 secs
(setq mtgox-api-poll-interval 10)

;;Enable mtgox-mode
(mtgox-mode 1)
```
