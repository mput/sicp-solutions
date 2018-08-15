#lang racket
#| Solution for exercise 2_17. |#

(require rackunit "../solutions/utils.rkt")
(provide last-pair)

(define (last-pair items)
  (cond ((null? items) (error "List can't be empty"))
        ((null? (cdr items)) items)
        (else (last-pair (cdr items)))))

