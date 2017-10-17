#! /usr/local/bin/csi -s
(use sicp)
(define nil (quote ()))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(print (subsets (list 1 2 3)))