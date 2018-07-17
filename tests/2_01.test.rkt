#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_01.rkt")


(define tests
  (test-suite
    "Test for exercise 2_01"
    (test-case
      "Test for (make-rat) with negative denom"
      (define rat-1 (make-rat 2 -4))
      (check-equal? (numer rat-1) -1)
      (check-equal? (denom rat-1) 2))
    (test-case
      "Test for (make-rat) with negative numers and denom"
      (define rat-1 (make-rat -2 -4))
      (check-equal? (numer rat-1) 1)
      (check-equal? (denom rat-1) 2))
    (test-case
      "Test for (make-rat) with negative numer"
      (define rat-1 (make-rat -2 4))
      (check-equal? (numer rat-1) -1)
      (check-equal? (denom rat-1) 2))
    (test-case
      "Test for (add-rat) with negative numers"
      (define rat-numb (add-rat (make-rat 1 2) (make-rat 1 3)))
      (check-equal? (numer rat-numb) 5)
      (check-equal? (denom rat-numb) 6))))


(run-tests tests 'verbose)

