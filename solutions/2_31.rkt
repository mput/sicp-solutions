#lang racket
#| Solution for exercise 2_31. |#

(provide tree-map)

(define (tree-map proc items)
  (map
    (lambda (item)
      (if (pair? item)
        (tree-map proc item)
        (proc item)))
    items))

