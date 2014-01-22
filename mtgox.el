;;; mtgox.el --- Mtgox extension, get the last average price

;; Copyright (C) 2014  Jorge Niedbalski R.

;; Author: Jorge Niedbalski R. <jnr@metaklass.org>
;; Version: 0.1
;; Package-Requires: ((json "1.2") (request "0.2.0"))
;; Keywords: news

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;; Code:

(require 'request)
(require 'json)

(defgroup mtgox nil
  "mtgox extension"
  :group 'comms
  :prefix "mtgox-")

(defconst mtgox-api-url "http://data.mtgox.com/api/2/BTCUSD/money/ticker")
(defcustom mtgox-api-poll-interval 10
  "Default interval to poll to the mtgox api"
  :type 'number
  :group 'mtgox)

(defvar mtgox-timer nil
  "Mtgox API poll timer")

(defvar mtgox-mode-line " $0.00"
  "Displayed on mode-line")

;;very risky :)
(put 'mtgox-mode-line 'risky-local-variable t)

(defun mtgox-start()
  (unless mtgox-timer
    (setq mtgox-timer
          (run-at-time "0 sec"
                       mtgox-api-poll-interval
                       #'mtgox-fetch))
    (mtgox-update-status)))

(defun mtgox-stop()
  (when mtgox-timer
    (cancel-timer mtgox-timer)
    (setq mtgox-timer nil)
    (if (boundp 'mode-line-modes)
        (delete '(t mtgox-mode-line) mode-line-modes))))

(defun mtgox-update-status()
  (if (not(mtgox-mode))
      (progn
        (if (boundp 'mode-line-modes)
            (add-to-list 'mode-line-modes '(t mtgox-mode-line) t)))))

(defun mtgox-fetch()
  (progn
    (request
     mtgox-api-url
     :parser 'json-read
     :success (function*
               (lambda(&key data &allow-other-keys)
                 (let* ((price (elt (assoc-default 'data data) 10))
                        (sell (elt price 3)))
                   (let* ((v (cdr sell)))
                     (setq mtgox-mode-line (concat " " v))
                     )))))))

;;;###autoload
(define-minor-mode mtgox-mode
  "Minor mode to display the latest BTC price at Mt Gox."
  :init-value nil
  :global t
  :lighter mtgox-mode-line
  (if mtgox-mode
       (progn
        (mtgox-start)
         )
    (mtgox-stop)
    ))

(provide 'mtgox)
;;; mtgox.el ends here
