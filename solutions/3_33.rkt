#lang racket
#| Solution for exercise 3_33. |#

(require "../solutions/constraints.rkt")
(provide avereger)

(define (avereger a b c)
  (define h1 (make-connector))
  (define h2 (make-connector))
  (adder a b h1)
  (constant 2 h2)
  (multiplier h2 c h1))
