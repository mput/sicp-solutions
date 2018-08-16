#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_20.rkt")


(define tests
  (test-suite
    "Test for exercise 2_20"
    (check-equal? (same-parity 4 6 1 34 3 4) (list 4 6 34 4))
    (check-equal? (same-parity 11 6 1 34 3 4) (list 11 1 3))))

(run-tests tests 'verbose)

