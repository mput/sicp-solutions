#lang sicp
(#%require rackunit "../solutions/{{ exc }}.rkt")
(#%require rackunit/text-ui)

(define tests
  (test-suite
    "simple suite"
    (check-equal? solutions 1 "Simple addition")
    (test-case
      "Case here"
      (check-not-equal? solutions 0 "stupid"))))

(run-tests tests 'verbose)

