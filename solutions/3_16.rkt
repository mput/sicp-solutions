#lang racket
#| Solution for exercise 3_16. |#

(provide count-pairs)

(define (count-pairs x)
  (if (not (mpair? x))
    0
    (+ (count-pairs (mcar x))
       (count-pairs (mcdr x))
       1)))

