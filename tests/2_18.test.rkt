#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_18.rkt")


(define tests
  (test-suite
    "Test for exercise 2_18"
    (check-equal? (reverse (list 1 2 3 4 5)) (list 5 4 3 2 1) "Should return reverse list")))

(run-tests tests 'verbose)

