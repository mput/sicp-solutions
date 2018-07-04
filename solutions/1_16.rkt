#lang racket
#| Solution for exercise 1_16. |#

(require rackunit "../solutions/utils.rkt")
(provide expt-iter)

(define (expt-iter number power)
  (define (iter acc curent-number curent-power)
    (cond ((= curent-power 0) acc)
          ((even? curent-power) (iter acc (square curent-number) (/ curent-power 2)))
          (else (iter (* acc curent-number) curent-number (- curent-power 1)))))
  (iter 1 number power))

