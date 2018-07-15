#lang racket
#| Solution for exercise 1_42. |#

(require rackunit "../solutions/utils.rkt")
(provide compose-fn)

(define (compose-fn fna fnb)
  (lambda (x) (fna (fnb x))))

