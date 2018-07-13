#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_38.rkt")


(define tests
  (test-suite
    "Check e"
    (check-true (aprox-equal-at e-computated (exp 1) 0.0001))))

(run-tests tests 'verbose)

