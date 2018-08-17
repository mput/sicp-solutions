#lang racket
#| Solution for exercise 2_21. |#

(require rackunit "../solutions/utils.rkt")
(provide square-list-plain square-list-map)

(define (square-list-plain items)
  (if (null? items)
    items
    (cons (square (car items))
          (square-list-plain (cdr items)))))

(define (square-list-map items)
  (map square items))
