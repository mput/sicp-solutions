#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define x (list (list 1 2 (list 9 10 11)) (list 3 4) (list 5 6)))

(define (fring list)
  (print "----->" list)
  (cond ((null? list) nil)
        ((not (pair? list)) (cons list nil))
        (else (append (fring (car list)) (fring (cdr list))))))

(print (fring x))

