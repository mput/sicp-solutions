#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_21.rkt")


(define tests
  (test-suite
    "Test for exercise 2_21"
    (check-equal? (square-list-plain (list 1 2 3 4)) (list 1 4 9 16))
    (check-equal? (square-list-map (list 1 2 3 4)) (list 1 4 9 16))))

(run-tests tests 'verbose)

