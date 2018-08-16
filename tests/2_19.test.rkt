#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/2_19.rkt")


(define tests
  (test-suite
    "Test for exercise 2_19"
    (test-case
      "Change doolars with us cents"
      (define us-coins (list 50 25 10 5 1))
      (check-equal? (cc 100 us-coins)  292 ""))
    (test-case
      "Change doolars with us cents (changed coins oreder)"
      (define us-coins (list 25 10 1 50 5))
      (check-equal? (cc 100 us-coins)  292 ""))))

(run-tests tests 'verbose)

