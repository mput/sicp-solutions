#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_17.rkt")


(define tests
  (test-suite
    "Test for exercise 2_17"
    (test-case
      "Should return list with only last element of list"
      (define  test-list (list 1 2 3 4))
      (check-equal? (last-pair test-list) (list 4) ""))))

(run-tests tests 'verbose)

