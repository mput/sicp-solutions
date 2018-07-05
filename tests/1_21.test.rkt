#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/1_21.rkt")


(define tests
  (test-suite
    "simple suite"
    (check-equal? (smallest-divisor 9) 3 "Smallest divisor of 199")
    (check-equal? (smallest-divisor 199) 199 "Smallest divisor of 199")
    (check-equal? (smallest-divisor 1999) 1999 "Smallest divisor of 199")
    (check-equal? (smallest-divisor 19999) 7 "Smallest divisor of 199")))

(run-tests tests 'verbose)

