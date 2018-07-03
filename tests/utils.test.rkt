#lang racket
#| Test my utils |#

(require rackunit "../solutions/utils.rkt")
(require rackunit/text-ui)

(define square-test
  (test-suite
    "Test for (square)"
    (check-equal? (square 6) (* 6 6))
    (check-equal? (square 9) (expt 9 2))))

(define aprox-equal-at-tests
  (test-suite
    "Tests for (aprox-equal-at)"
    (test-case
      "Truthy cases"
      (check-true (aprox-equal-at 3.22 3 0.3))
      (check-true (aprox-equal-at 50 50.01 0.03))
      (check-true (aprox-equal-at -50 -50.02 0.03))
      (check-true (aprox-equal-at -0.5 0.2 1)))
    (test-case
      "Falsy cases"
      (check-false (aprox-equal-at 10 10.1 0.05))
      (check-false (aprox-equal-at -10 -10.5 0.2))
      (check-false (aprox-equal-at 0.5 -0.2 0.5)))))

(define even?-test
  (test-suite
    "Test for (square)"
    (check-true (even? 6))
    (check-true (even? 2))
    (check-false (even? 1))
    (check-false (even? 11))))



(run-tests square-test 'verbose)
(run-tests aprox-equal-at-tests 'verbose)
(run-tests even?-test 'verbose)

