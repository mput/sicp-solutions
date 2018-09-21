#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/2_31.rkt")

(define tree (list 2 3 (list 4 5)))
(define tree-in-square (list 4 9 (list 16 25)))

(define tests
  (test-suite
    "Test for exercise 2_30"
    (test-case
      "tree map"
      (check-equal? (tree-map square tree) tree-in-square))))

(run-tests tests 'verbose)
