#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_34.rkt")


(define tests
  (test-suite
    "Test for exercise 2_34"
    (test-case
      "Case here"
      (define koef-seq (list 2 1 3 2))
      (check-equal? (horner-eval 2 koef-seq) 32))
    (test-case
      "Case here"
      (define koef-seq (list 1 3 0 5 0 1))
      (check-equal? (horner-eval 2 koef-seq) 79))))

(run-tests tests 'verbose)

