#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_61.rkt")
(require rackunit "../solutions/2_62.rkt")

(define test-set '(1 4 5 6 9))
(define test-set-2 '(3 5 7 9))

(define tests
  (test-suite
    "Test for exercise 2_59 (Sets)"
    (test-case
      "union set"
      (define test-union-set (union-set test-set-2 test-set))
      (check-true (element-of-set? 6 test-union-set))
      (check-true (element-of-set? 7 test-union-set)))))

(run-tests tests 'verbose)

