Emacs btc-ticker-mode
=====================

Emacs minor-mode to display current Bitcoin price on the
mode-line.

![Screenshot](https://github.com/pennersr/emacs-btc-ticker/blob/master/screenshot.png?raw=true)

Installation
------------

Your .emacs file should looks like:

    (require 'btc-ticker)

    ;;Optional: You can setup the fetch interval
    ;;default: 10 secs
    (setq btc-ticker-api-poll-interval 10)

    ;;Enable btc-ticker-mode
    (btc-ticker-mode 1)
