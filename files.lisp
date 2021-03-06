;;;; archer: files.lisp
;;; macros for dealing with files

(defmacro def<-file (global-var filename)
  "Read the filename specified into the var."
    `(with-open-file (in ,filename)
       (with-standard-io-syntax
         (defparameter ,global-var (read in)))))

(defmacro ->file (sym filename)
  "Attempt to print the symbol to the file."
  `(with-open-file (out ,filename
                        :direction :output
                        :if-exists :supersede)
     (with-standard-io-syntax
       (print ,sym out))))

(defun install-image (image-path toplevel)
  (if (stringp image-path)
      (progn
        (format t "[+] writing to ~A~%" (pathname image-path))
        (sb-ext:save-lisp-and-die (pathname image-path)
                                  :executable t
                                  :toplevel toplevel))
      (progn
        (format t "~%~%[!] invalid image name!~%")
        (sb-ext:exit :code 1))))
