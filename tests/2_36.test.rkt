#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_36.rkt")


(define tests
  (test-suite
    "Test for exercise 2_36"
    (test-case
      "accumulate-n"
      (define list-of-lists
        (list (list 1 2 3) (list 2 3 4) (list 3 4 5)))
      (check-equal? (accumulate-n + 0 list-of-lists) (list 6 9 12)))))

(run-tests tests 'verbose)

