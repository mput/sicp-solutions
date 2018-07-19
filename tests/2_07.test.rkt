#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_07.rkt")


(define tests
  (test-suite
    "Test for exercise 2_07"
    (test-case
      "Case here"
      (define interval (make-interval 0.95 1.05))
      (check-equal? (lower-bound interval) 0.95)
      (check-equal? (upper-bound interval) 1.05))))

(run-tests tests 'verbose)

