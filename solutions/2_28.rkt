#lang racket
#| Solution for exercise 2_28. |#

(require rackunit "../solutions/utils.rkt")
(provide fringe)

(define (fringe items)
  (cond ((null?  items) (list))
        ((pair? items) (append (fringe (car items)) (fringe (cdr items))))
        (else (list items))))



