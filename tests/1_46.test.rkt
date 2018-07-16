#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/1_46.rkt")


(define tests
  (test-suite
    "Test for exercise 1_46"
    (check-close? (my-sqrt 81) 9 0.0001)
    (check-close? (my-sqrt 10) (sqrt 10) 0.0001)
    (check-close? (fixed-point (lambda (x) (+ 1.0 (/ 1 x)))) 1.618 0.0001)))

(run-tests tests 'verbose)

