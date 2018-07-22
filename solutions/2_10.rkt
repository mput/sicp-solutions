#lang racket
#| Solution for exercise 2_10. |#

(require rackunit "2_07.rkt")
(provide div-interval)

(define (div-interval x y)
  (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
    (error "Second interval is crossing zerro")
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))

