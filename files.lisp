;;;; archer: files.lisp
;;; macros for dealing with files

(defmacro file->var (filename var)
  "Read the filename specified into the var."
    `(with-open-file (in ,filename)
       (with-standard-io-syntax
         (setf ,var (read in)))))
