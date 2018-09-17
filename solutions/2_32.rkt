#lang racket
#| Solution for exercise 2_32. |#

(require rackunit "../solutions/utils.rkt")
(provide subsets)

(define (subsets items)
  (if (null? items)
    (list '())
    (let ((rest (subsets (cdr items))))
      (append rest (map
                     (lambda (item)
                       (cons (car items) item))
                     rest)))))

