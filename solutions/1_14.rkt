#lang racket
#| Solution for exercise 1_14. |#

(require rackunit "../solutions/utils.rkt")
(provide expt-iter)

(define (expt-iter number power)
  (define (iter acc curent-power)
    (displayln (list number acc curent-power))
    (if (> curent-power 140) (/ 1 0) 3)
    (cond ((= curent-power 1) acc)
          ((even? curent-power) (iter (square acc) (/ curent-power 2)))
          (else (displayln acc) (iter (* acc number) (- curent-power 1)))))
  (iter 1 power))

