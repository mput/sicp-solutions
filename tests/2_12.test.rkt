#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_07.rkt")
(require rackunit "../solutions/2_12.rkt")


(define tests
  (test-suite
    "Test for exercise 2_12"
    (test-case
      "Test percent interval"
      (define test-int (make-center-percent 12 10))
      (check-equal? (lower-bound test-int) 10.8)
      (check-equal? (upper-bound test-int) 13.2)
      (check-equal? (center test-int) 12.0)
      (check-close? (width test-int) 1.2 0.000001))))

(run-tests tests 'verbose)

