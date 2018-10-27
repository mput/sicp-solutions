#lang racket
#| Solution for exercise 3_01. |#

(provide make-accumulator)


(define (make-accumulator curval)
  (lambda (surplus)
    (set! curval (+ curval surplus))
    curval))

