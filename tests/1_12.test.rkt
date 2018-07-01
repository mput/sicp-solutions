#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/1_12.rkt")


(define tests
  (test-suite
    "simple suite"
    (check-equal? (get-pascal-triangle-value 1 1) 1)
    (check-equal? (get-pascal-triangle-value 3 2) 2)
    (check-equal? (get-pascal-triangle-value 5 3) 6)
    (check-equal? (get-pascal-triangle-value 14 5) 715)))

(run-tests tests 'verbose)

