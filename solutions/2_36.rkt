#lang racket
#| Solution for exercise 2_36. |#

(require rackunit "../solutions/utils.rkt")
(provide accumulate-n)

(define (accumulate-n proc init list-of-lists)
  (if (null? (car list-of-lists))
    '()
    (cons (foldr proc init (map car list-of-lists))
          (accumulate-n proc init (map cdr list-of-lists)))))

