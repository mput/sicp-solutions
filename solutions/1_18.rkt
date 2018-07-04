#lang racket
#| Solution for exercise 1_18. |#

(require rackunit "../solutions/1_17.rkt")
(provide fast-mult-iter)

(define (fast-mult-iter a b)
  (define (helper-iter acc a b)
    (cond ((= b 0) acc)
          ((even? b) (helper-iter acc (double a) (halve b)))
          (else (helper-iter (+ acc a) a (- b 1)))))
  (helper-iter 0 a b))
