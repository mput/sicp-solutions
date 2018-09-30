#lang racket

(require rackunit/text-ui)
(require rackunit)
(require (except-in "../solutions/2_59.rkt" adjoin-set union-set))
(require "../solutions/2_60.rkt")

(define test-set '(1 2 3 x g 2 1 x))
(define test-set-2 '(y z x z x))

(define tests
  (test-suite
    "Test for exercise 2_59 (Sets)"
    (test-case
      "Element of set"
      (check-true (element-of-set? 'x test-set))
      (check-false (element-of-set? 'z test-set)))
    (test-case
      "Adjoin set"
      (check-true (element-of-set? 'z (adjoin-set 'z test-set))))
    (test-case
      "Union set"
      (define test-union-set (union-set test-set-2 test-set))
      (check-true (element-of-set? 'z test-union-set))
      (check-true (element-of-set? 1 test-union-set)))
    (test-case
      "Intersection set"
      (define test-instersection-set (instersection-set test-set-2 test-set))
      (check-true (element-of-set? 'x test-instersection-set))
      (check-false (element-of-set? 'y test-instersection-set)))))

(run-tests tests 'verbose)

