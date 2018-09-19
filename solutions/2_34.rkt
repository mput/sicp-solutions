#lang racket
#| Solution for exercise 2_34. |#

(require rackunit "../solutions/utils.rkt")
(provide horner-eval)

(define (accumulate proc initial seq)
  (if (null? seq)
    initial
    (proc (car seq) (accumulate proc initial (cdr seq)))))


(define (horner-eval x coefficient-sequence)
  (accumulate
    (lambda
      (this-coef higher-term)
      (+ this-coef (* higher-term x)))
    0
    coefficient-sequence))
