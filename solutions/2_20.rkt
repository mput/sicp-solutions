#lang racket
#| Solution for exercise 2_20. |#

(require rackunit "../solutions/utils.rkt")
(provide same-parity)

(define (same-parity head . tail)
  (define (helper acc items)
    (if (null? items)
      acc
      (let ((first (car items))
            (rest (cdr items)))
        (helper
          (if (equal-parity? first head) (cons first acc) acc)
          rest))))
  (reverse (helper (list head) tail)))


(define (equal-parity? a b)
  (= (remainder a 2) (remainder b 2)))
