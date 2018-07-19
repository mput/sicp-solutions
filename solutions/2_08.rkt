#lang racket
#| Solution for exercise 2_08. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "2_07.rkt")
(provide sub-interval)

(define (sub-interval int1 int2)
  (make-interval (- (lower-bound int1) (upper-bound int2))
                 (- (upper-bound int1) (lower-bound int2))))

