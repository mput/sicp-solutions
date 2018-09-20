#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_35.rkt")


(define tests
  (test-suite
    "Test for exercise 2_35"
    (test-case
      "Count leaves with accumulate"
      (define tree (list 1 2 (list 10 20 (list 3 40) 32)))
      (check-equal? (count-leaves-acc tree) 7))))

(run-tests tests 'verbose)

