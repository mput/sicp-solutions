#lang racket
#| Solution for exercise 3_14. |#

(require compatibility/mlist)
(provide mystery)

(define (mystery x)
  (define (loop x y)
    (if (null? x)
      y
      (let ((temp (mcdr x)))
        (set-mcdr! x y)
        (loop temp x))))
  (loop x '()))

