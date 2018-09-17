#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_32.rkt")


(define tests
  (test-suite
    "Get all subsets"
    (test-case
      "Case here"
      (define items (list 1 2 3))
      (define items-subsets (list (list) (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3)))
      (check-equal? (subsets items) items-subsets))))

(run-tests tests 'verbose)

