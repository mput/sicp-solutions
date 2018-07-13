#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/1_39.rkt")

(define tests
  (test-suite
    "Computate tangents"
    (check-close? (tan-cf 1 4) (tan 1) 0.0001 "Simple addition")
    (check-close? (tan-cf pi 10) 0 0.0001 "Simple addition")
    (check-close? (tan-cf 3 10) (tan 3) 0.0001 "Simple addition")))

(run-tests tests 'verbose)

