#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/3_01.rkt" make-accumulator))

(define tests
  (test-suite
    "Test for exercise 3_01"
    (test-case
      "Test accumulator"
      (define acc1 (make-accumulator 10))
      (define acc2 (make-accumulator 10))
      (acc1 15)
      (acc2 190)
      (acc1 75)
      (acc2 100)
      (check-equal? (acc1 1) 101)
      (check-equal? (acc2 1) 301))))

(run-tests tests 'verbose)

