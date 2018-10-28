#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "./custom-checks.rkt" check-close?))
(require (only-in "../solutions/3_05.rkt" estimate-unit-disk-area))


(define tests
      (test-suite
              "Test for exercise 3_05"
              (check-close? (estimate-unit-disk-area 100000.) pi 0.01)))

(run-tests tests 'verbose)

