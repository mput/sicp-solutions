#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_14.rkt")


(define tests
  (test-suite
    "simple suite"
    (check-equal? (expt-iter 2 2) 4 "Simple")
    (check-equal? (expt-iter 2 3) 8 "Simple uneven")
    (check-equal? (expt-iter 7 8) (expt 7 8) "Big numbers")))

(run-tests tests 'verbose)

