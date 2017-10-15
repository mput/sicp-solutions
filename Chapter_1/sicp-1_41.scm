#! /usr/local/bin/csi -s
(use sicp)

(define (double fun) (lambda (x) (fun (fun x))))

(print ((double (lambda (x) (+ 1 x))) 5))

(print (((double (double double)) (lambda (x) (+ 1 x))) 5))
