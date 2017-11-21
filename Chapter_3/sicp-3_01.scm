#! /usr/local/bin/csi -s
(use sicp)

(define (make-accumulator x)
  (lambda (addent) 
    (set! x (+ addent x))
    x))

(define A (make-accumulator 10))

(print (A 15))

(print (A 8))