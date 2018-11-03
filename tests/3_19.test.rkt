#lang racket

(require compatibility/mlist)
(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/3_19.rkt" has-cycle?))


(define tests
  (test-suite
    "Test for exercise 3_18"
    (test-case
      "Case without cycle"
      (define items (mlist 1 2 3))
      (check-false (has-cycle? items)))
    (test-case
      "Case without cycle"
      (define pair-b (mcons 2 '()))
      (define pair-a (mcons 1 pair-b))
      (set-mcdr! pair-b pair-a)
      (check-true (has-cycle? pair-a)))
    (test-case
      "Case one cycle pair"
      (define pair-a (mcons 1 '()))
      (set-mcdr! pair-a pair-a)
      (check-true (has-cycle? pair-a)))
    (test-case
      "Case without cycle"
      (define pair-c (mcons 3 '()))
      (define pair-b (mcons 2 pair-c))
      (define pair-a (mcons 1 pair-b))
      (set-mcdr! pair-c pair-b)
      (check-true (has-cycle? pair-a)))))

(run-tests tests 'verbose)

