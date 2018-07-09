#lang racket
#| Solution for exercise 1_31. |#

(provide product product-reqursive)

(define (product term a next b)
  (define (product-iter next-a acc)
    (if (> next-a b)
      acc
      (product-iter (next next-a) (* (term next-a) acc))))
  (product-iter a 1))

(define (product-reqursive term a next b)
  (if (> a b)
    1
    (* (term a) (product-reqursive term (next a) next b))))
