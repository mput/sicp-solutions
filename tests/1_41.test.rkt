#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/1_41.rkt")

(define (inc a) (+ a 1))

(define tests
  (test-suite
    "Test for exercise 1_41"
    (check-equal? ((double inc) 5) 7)
    (check-equal? (((double double) inc) 5) 9)
    (check-equal? (((double (double double)) inc) 5) 21)))

(run-tests tests 'verbose)

