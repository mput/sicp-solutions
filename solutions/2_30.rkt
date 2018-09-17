#lang racket
#| Solution for exercise 2_30. |#

(require rackunit "../solutions/utils.rkt")
(provide square-tree map-square-tree)


(define (square-tree items)
  (cond ((null? items) items)
        ((pair? items) (cons (square-tree (car items)) (square-tree (cdr items))))
        (else (square items))))


(define (map-square-tree items)
  (map
    (lambda (item)
      (if (pair? item)
        (map-square-tree item)
        (square item)))
    items))
