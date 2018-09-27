#lang racket
#| Solution for exercise 2_54. |#

(require rackunit "../solutions/utils.rkt")
(provide my-equal?)

(define (my-equal? items-1 items-2)
  (if (and (pair? items-1) (pair? items-2))
    (and (my-equal? (car items-1) (car items-2))
         (my-equal? (cdr items-1) (cdr items-2)))
    (eq? items-1 items-2)))

