#lang racket
#| Solution for exercise 2_17. |#

(require rackunit "../solutions/utils.rkt")
(provide last-pair)

(define (last-pair items)
  (if (null? (cdr items))
    items
    (last-pair (cdr items))))

