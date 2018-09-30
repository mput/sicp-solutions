#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_61.rkt")

(define test-set '(1 4 5 6 9))
(define test-set-2 '(3 5 7 9))

(define tests
  (test-suite
    "Test for exercise 2_59 (Sets)"
    (test-case
      "Element of set"
      (check-true (element-of-set? 5 test-set))
      (check-false (element-of-set? 2 test-set))
      (check-false (element-of-set? 2 '())))
    (test-case
      "Adjoin set"
      (check-true (element-of-set? 2 (adjoin-set 2 test-set))))
    (test-case
      "Intersection set"
      (define test-instersection-set (instersection-set test-set-2 test-set))
      (check-true (element-of-set? 5 test-instersection-set))
      (check-false (element-of-set? 1 test-instersection-set)))))

(run-tests tests 'verbose)

