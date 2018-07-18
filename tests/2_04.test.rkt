#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_04.rkt")


(define tests
  (test-suite
    "Test for exercise 2_04"
    (test-case
      "Test for piculiar pair realisation"
      (define testpair (n-cons 5 10))
      (check-equal? (n-car testpair) 5)
      (check-equal? (n-cdr testpair) 10))))

(run-tests tests 'verbose)

