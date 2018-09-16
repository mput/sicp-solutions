#lang racket
#| Solution for exercise 2_27. |#

(require rackunit "../solutions/utils.rkt")
(provide deep-reverse)

(define (deep-reverse items)
  (cond ((null? items) (list))
        ((pair? items) (append (deep-reverse (cdr items))
                               (list (deep-reverse (car items)))))
        (else items)))
