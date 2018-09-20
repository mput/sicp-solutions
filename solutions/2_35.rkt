#lang racket
#| Solution for exercise 2_35. |#

(require rackunit "../solutions/utils.rkt")
(provide count-leaves-acc)

(define (count-leaves-acc tree)
  (foldr + 0 (map
               (lambda (val)
                 (if (pair? val)
                   (count-leaves-acc val)
                   1))
               tree)))
