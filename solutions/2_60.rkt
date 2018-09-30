#lang racket
#| Solution for exercise 2_60. |#


(provide adjoin-set union-set)

(define (adjoin-set elm set) (cons elm set))

(define (union-set set1 set2) (append set1 set2))


