#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_43.rkt")


(define tests
  (test-suite
    "Test for exercise 1_43"
    (check-equal? ((repeated square 2) 5) 625)
    (check-equal? ((repeated square 0) 5) 5)
    (check-equal? ((repeated inc 4) 5) 9)
    (check-equal? ((repeated square 4) 2) 65536)))

(run-tests tests 'verbose)

