;;; Tests for proc-plus stuff

(require 'proc-plus)
(require 'noflet)
(require 'ert)

(ert-deftest proc+env-add-path ()
  (let ((values (make-hash-table :test 'equal)))
    (puthash "GOROOT" "/home/test/go" values)
    (puthash "PATH" "/usr/bin:/bin:/usr/local/bin" values)
    (noflet ((setenv (var value)
               (puthash var value values))
             (getenv (var)
               (gethash var values))
             (substitute-in-file-name (filename)
               (replace-regexp-in-string
                "$\\([A-Z_a-z-][A-Z_a-z0-9-]+\\)"
                (lambda (var) (gethash (match-string 1 var) values))
                filename t)))
      (should
       (equal (proc+env-add-path "PATH" "$GOROOT/bin")
              "/home/test/go/bin:/usr/bin:/bin:/usr/local/bin"))
      (should
       (equal (proc+env-add-path "PATH" "$GOROOT/bin")
              "/home/test/go/bin:/usr/bin:/bin:/usr/local/bin")))))

;;; proc-plus-tests.el ends here
