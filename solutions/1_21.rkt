#lang racket
#| Solution for exercise 1_21. |#

(require rackunit "../solutions/utils.rkt")
(provide smallest-divisor)

(define (divisor? a b) (= (remainder b a) 0))

(define (smallest-divisor n)
  (define (iter curnumb)
    (cond ((> (square curnumb) n) n)
          ((divisor? curnumb n) curnumb)
          (else (iter (+ curnumb 1)))))
  (iter 2))

