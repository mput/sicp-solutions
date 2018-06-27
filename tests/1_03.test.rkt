#lang racket
(require rackunit "../solutions/1_03.rkt")
(require rackunit/text-ui)

(define tests
  (test-suite
    "Shuld return sum of squares of two biggests number"
    (check-equal? (solution 1 3 2) 13)
    (check-not-equal? (solution 1 3 2) 12)
    (check-equal? (solution 5 3 6) (+ (expt 5 2) (expt 6 2)))))

(run-tests tests 'verbose)

