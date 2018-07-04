#lang racket
#| Solution for exercise 1_17. |#

(require rackunit "../solutions/utils.rkt")
(provide fast-mult)

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

