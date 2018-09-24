#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_42.rkt")


(define tests
  (test-suite
    "Test for exercise 2_42"
    (test-case
      "0 solutions of puzzle for 3x3 board"
      (check-equal? (length (quins 3)) 0))
    (test-case
      "92 solutions of puzzle for 8x8 board"
      (check-equal? (length (quins 8)) 92))
    (test-case
      "Solutions of puzzle for 4x4 board"
      (check-equal? (quins 4) (list (list 2 4 1 3) (list 3 1 4 2))))))

(run-tests tests 'verbose)

