#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/{{ exc }}.rkt")


(define tests
  (test-suite
    "Test for exercise {{ exc }}"
    (check-equal? solutions 1 "")
    (test-case
      "Case here"
      (check-not-equal? solutions 0 ""))))

(run-tests tests 'verbose)

