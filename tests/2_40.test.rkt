#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_40.rkt")


(define tests
  (test-suite
    "Test for exercise 2_40"
    (test-case
      "Uniq pairs"
      (define uniq-list-3 (list (list 2 1) (list 3 1) (list 3 2)))
      (check-equal? (uniq-pairs 3) uniq-list-3))))

(run-tests tests 'verbose)

