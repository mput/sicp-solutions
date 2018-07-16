#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_44.rkt")


(define tests
  (test-suite
    "Test for exercise 1_44"
    (check-close? ((smooth square) 5.0) 25 0.01)
    (check-close? ((smooth-n-times square 5) 5.0) 25 0.1)))

(run-tests tests 'verbose)

