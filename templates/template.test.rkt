#lang sicp
(#%require rackunit "../../Chapter_1/1.02.rkt")
(#%require rackunit/text-ui)

(define tests
  (test-suite
    "simple suite"
    (check-equal? exp 11 "Simple addition")
    (check-equal? exp 11 "Simple addition2")
    (test-case
      "Case here"
      (check-equal? 12 12 "stupid"))))

(run-tests tests 'verbose)

