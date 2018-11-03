#lang racket

(require rackunit  rackunit/text-ui)
(require compatibility/mlist)
(require (only-in "../solutions/3_17.rkt" count-pairs))

(define tests
  (test-suite
    "Test for exercise 3_16"
    (test-case
      "Case where solution work right"
      (define a (mlist 1 2 3))
      (check-equal? (count-pairs a) 3))
    (test-case
      "Case where solution return 4"
      (define pair-three (mcons 'a 'b))
      (define pair-two (mcons pair-three pair-three))
      (define pair-one (mcons 'a pair-two))
      (check-equal? (count-pairs pair-one) 3))
    (test-case
      "Case where solution return 4"
      (define pair-three (mcons 'a 'b))
      (define pair-two (mcons pair-three pair-three))
      (define pair-one (mcons pair-two pair-two))
      (check-equal? (count-pairs pair-one) 3))
    (test-case
      "Case where solution return 2 for cycle pairs"
      (define pair-two (mcons 'b 's))
      (define pair-one (mcons 'a pair-two))
      (set-mcdr! pair-two pair-one)
      (check-equal? (count-pairs pair-one) 2))))

(run-tests tests 'verbose)

