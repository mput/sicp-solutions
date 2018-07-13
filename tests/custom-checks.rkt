#lang racket

(require rackunit)
(require "../solutions/utils.rkt")

(provide (all-defined-out))

(define-check (check-close? a b tolerance)
              (if (aprox-equal-at a b tolerance)
                true
                (fail-check (~a a " is not close enough to " b ". Difference is " (abs (- a b)) " but should be < " tolerance " !"))))

