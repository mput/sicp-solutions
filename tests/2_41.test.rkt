#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_41.rkt")


(define tests
  (test-suite
    "Test for exercise 2_41"
    (test-case
      "Case here"
      (define sol-list (list (list 3 2 5) (list 4 1 5)))
      (check-equal? (sum-pairs 4 5) sol-list))))


(run-tests tests 'verbose)

