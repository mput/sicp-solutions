#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_29.rkt")

(define tests
  (test-suite
    "simple suite"
    (check-true (aprox-equal-at
                  (simpson-int cube 0 1.0 100)
                  0.25
                  0.0001) "Integral of cube should be 1/4")
    (check-true (aprox-equal-at
                  (simpson-int cube 0 1.0 1000)
                  0.25
                  0.00000001) "Integral of cube should be 1/4")))

(run-tests tests 'verbose)

