;;;; archer: files.lisp
;;; macros for dealing with files

(defmacro def<-file (global-var filename)
  "Read the filename specified into the var."
    `(with-open-file (in ,filename)
       (with-standard-io-syntax
         (defparameter ,global-var (read in)))))
