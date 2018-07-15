#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_42.rkt")


(define tests
  (test-suite
    "Test for exercise 1_42"
    (check-equal? ((compose-fn square inc) 6) 49)
    (check-equal? ((compose-fn cube square) 2) 64)))

(run-tests tests 'verbose)

