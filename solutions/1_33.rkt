#lang racket
#| Solution for exercise 1_33. |#

(require rackunit "../solutions/utils.rkt")
(provide filter-accumulate)

(define (filter-accumulate combiner filter null-value term a next b)
  (if (> a b)
    null-value
    (combiner (if (filter a) (term a) null-value)
              (filter-accumulate combiner filter null-value term (next a) next b))))
