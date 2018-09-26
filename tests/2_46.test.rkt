#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_46.rkt")

(define vect-c (make-vect 0.5 0.5))
(define vect-1 (make-vect 1. 1.))

(define tests
  (test-suite
    "Test for exercise 2_46"
    (test-case
      "Check add-vect"
      (check-equal? (add-vect vect-c vect-1) (make-vect 1.5 1.5)))
    (test-case
      "Check sub-vect"
      (check-equal? (sub-vect vect-1 vect-c) vect-c))
    (test-case
      "Check sub-vect"
      (check-equal? (scale-vect 2 vect-c) vect-1))))

(run-tests tests 'verbose)

