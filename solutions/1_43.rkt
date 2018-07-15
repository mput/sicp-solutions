#lang racket
#| Solution for exercise 1_43. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_42.rkt")
(provide repeated)

(define (repeated fn times)
  (define (helper result-fn time)
    (if (= times time)
      result-fn
      (helper (compose-fn fn result-fn) (+ time 1))))
  (if (= times 0)
     identity
     (helper fn 1)))


