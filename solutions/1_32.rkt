#lang racket
#| Solution for exercise 1_32. |#

(require rackunit "../solutions/utils.rkt")
(provide accumulation accumulation-iter)
(define (accumulation null-value combiner term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulation null-value combiner term (next a) next b))))

(define (accumulation-iter null-value combiner term a next b)
  (define (iter next-a acc)
    (if (> next-a b)
      acc
      (iter (next next-a) (combiner (term next-a) acc))))
  (iter a null-value))
