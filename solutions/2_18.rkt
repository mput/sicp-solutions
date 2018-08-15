#lang racket
#| Solution for exercise 2_18. |#

(require rackunit "../solutions/utils.rkt")
(provide reverse)

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (reverse items)
  (if (null? items)
    items
    (append (reverse (cdr items)) (list (car items)))))

