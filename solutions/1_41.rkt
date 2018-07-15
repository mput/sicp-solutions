#lang racket
#| Solution for exercise 1_41. |#

(require rackunit "../solutions/utils.rkt")
(provide double)

(define (double fun)
  (lambda (x) (fun (fun x))))

