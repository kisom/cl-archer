;;;; init.lisp
;;; this is the init file for archer
;;; written by Kyle Isom <kyle@nodality.io>
;;;
;;; all this file does is load other files from archer here.

(defparameter *archer-base* "/Users/kyle/code/archer")

(defmacro archer-load (filename)
  `(format t "-> LOADING ~A: ~:[FAIL~;ok~]~%"
           ,filename
           (load (format nil "~A/~A.lisp"
                         *archer-base*
                         ,filename))))

(defparameter *archer-files* '("files"))

(dolist (file-target *archer-files*)
  (archer-load file-target))
