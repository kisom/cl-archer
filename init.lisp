;;;; init.lisp
;;; this is the init file for archer
;;; written by Kyle Isom <kyle@nodality.io>
;;;
;;; all this file does is load other files from archer here.

(defparameter *archer-base* (merge-pathnames ".archer"
                                             (user-homedir-pathname)))
(defparameter *archer-files* '("files"))

(defmacro archer-load (filename)
  `(format t "-> LOADING ~A: ~:[FAIL~;ok~]~%"
           ,filename
           (load (format nil "~A/~A.lisp"
                         *archer-base*
                         ,filename))))

(dolist (file-target *archer-files*)
  (archer-load file-target))
