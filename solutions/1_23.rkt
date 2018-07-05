#lang racket
#| Solution for exercise 1_23. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_21.rkt")
(require rackunit "../solutions/1_22.rkt")

(provide better-prime?)

(define (smallest-divisor-enchenced n)
  (define (iter curnumb)
    (cond ((> (square curnumb) n) n)
          ((divisor? curnumb n) curnumb)
          (else (iter (if (= curnumb 2)
                        (+ curnumb 1)
                        (+ curnumb 2))))))
  (iter 2))

(define (better-prime? n)
  (= (smallest-divisor-enchenced n) n))

