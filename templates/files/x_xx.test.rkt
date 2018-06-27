#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/{{ exc }}.rkt")


(define tests
  (test-suite
    "simple suite"
    (check-equal? solutions 1 "Simple addition")
    (test-case
      "Case here"
      (check-not-equal? solutions 0 "stupid"))))

(run-tests tests 'verbose)

