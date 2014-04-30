;;; proc-plus.el --- process improvements

;; Copyright (C) 2014  Nic Ferrier

;; Author: Nic Ferrier <nferrier@ferrier.me.uk>
;; Keywords: processes

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

;; Various process improvements

;;; Code:

(defun proc+env-add-path (var value)
  "Add VALUE to env var VAR if it's not there already."
  (let ((e-val (substitute-in-file-name value)))
    (if (member e-val (split-string (getenv var) ":"))
        (getenv var)
        (setenv var (concat (getenv var) ":" e-val)))))

(provide 'proc-plus)

;;; proc-plus.el ends here
