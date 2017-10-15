#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (for-each fn list)
  (cond ((null? list) #t)
        (else (fn (car list)) (for-each fn (cdr list)))))

(for-each (lambda (x) (newline) (display x)) (list 1 2 3 4 5))