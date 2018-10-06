#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/{{ exc }}.rkt"))


(define tests
  (test-suite
    "Test for exercise {{ exc }}"
    (check-equal? solutions 1 "")
    (test-case
      "Case here"
      (check-equal? solutions 0 ""))))

(run-tests tests 'verbose)

