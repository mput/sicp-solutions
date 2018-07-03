#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_16.rkt")


(define tests
  (test-suite
    "simple suite"
    (check-equal? (expt-iter 2 2) 4 "Simple")
    (check-equal? (expt-iter 3 6) 729 "Simple uneven")
    (check-equal? (expt-iter 3 6) (expt 3 6) "Simple uneven")
    (check-equal? (expt-iter 6 8) (expt 6 8) "Simple uneven")
    (check-equal? (expt-iter 6 9) (expt 6 9) "Simple uneven")))

(run-tests tests 'verbose)

