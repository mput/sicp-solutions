#lang racket
#| Solution for exercise 1_30. |#

(require rackunit "../solutions/utils.rkt")
(provide sum-iter)

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

