#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_02.rkt")


(define tests
  (test-suite
    "Test for exercise 2_02"
    (test-case
      "Find midpoint"
      (define segment (make-segment (make-point 1 2) (make-point 3 4)))
      (define segment-midpoint (mid-point segment))
      (check-equal? (x-point segment-midpoint) 2)
      (check-equal? (y-point segment-midpoint) 3))))

(run-tests tests 'verbose)

