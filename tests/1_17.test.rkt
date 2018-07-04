#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/1_17.rkt")


(define tests
  (test-suite
    "simple suite"
    (check-equal? (fast-mult 3 5) (* 3 5) "Simple mult")
    (check-equal? (fast-mult 123 13423) (* 123 13423))
    (check-equal? (fast-mult 5 123456789) (* 5 123456789))
    (check-equal? (fast-mult 0 0) 0 "Zero case")
    (check-equal? (fast-mult 23 1) (* 23 1) "Mult to one case")))

(run-tests tests 'verbose)

