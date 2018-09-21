#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_39.rkt")

(define items (list 1 2 3 4 5 6))

(define tests
  (test-suite
    "Test for exercise 2_39"
    (test-case
      "Reverse with right fold"
      (check-equal? (reverse-rf items) (reverse items)))
    (test-case
      "Reverse with left fold"
      (check-equal? (reverse-lf items) (reverse items)))))
(run-tests tests 'verbose)

