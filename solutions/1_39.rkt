#lang racket
#| Solution for exercise 1_39. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_37.rkt")

(provide tan-cf)

(define (tan-cf x k)
  (cont-frac
    (lambda (i)
      (if (= i 1)
        x
        (- (square x))))
    (lambda (i)
      (- (* 2 i) 1))
    k))

