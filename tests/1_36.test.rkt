#lang racket
#| To run with logs use "make test_with_my_logs e=1_36" |#
(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_36.rkt")

(log-debug "Log from tests")

(define tests
  (test-suite
    "simple suite"
    (check-true (aprox-equal-at (expt-x-to-x-equal 1000) 4.555 0.001))))

(run-tests tests 'verbose)

