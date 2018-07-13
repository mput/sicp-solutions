#lang racket
#| Solution for exercise 1_38. |#

(require rackunit "../solutions/1_37.rkt")

(provide e-computated)

(define e-computated
  (+ 2 (cont-frac-iter
         (lambda (x) 1)
         (lambda (x)
           (let ((index (+ x 1)))
             (if (= (remainder index 3) 0)
               (* 2 (/ index 3))
               1)))
         10)))

