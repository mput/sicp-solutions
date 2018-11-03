#lang racket

(require rackunit  rackunit/text-ui)
(require compatibility/mlist)
(require (only-in "../solutions/3_14.rkt" mystery))

;; much better name for mastery is reverse.

(define a (mlist 1 2 3 4))
(displayln (mystery a))
(displayln a)

(define tests
  (test-suite
    "Test for exercise 3_14"
    (test-case
      "Case here"
      (define a (mlist 1 2 3 4))
      (define reverse-a (mlist 4 3 2 1))
      (check-equal? (mystery a) reverse-a)
      (check-equal? a (mlist 1)))))

(run-tests tests 'verbose)

