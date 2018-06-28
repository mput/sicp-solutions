#lang racket

(require rackunit/text-ui)
(require rackunit "../solutions/utils.rkt")
(require rackunit "../solutions/1_08.rkt")


(define (aprox-equal? arg1 arg2) (aprox-equal-at arg1 arg2 0.0001))

(define tests
  (test-suite
    "Test cube-root function"
    (test-case
      "Normal numbers"
          (check-true (aprox-equal? (expt (cube-root 31) 3) 31))
          (check-true (aprox-equal? (cube-root 27) 3)))
    (test-case
      "Small numbers"
            (check-true (aprox-equal? (expt (cube-root 0.3) 3) 0.3)))
    (test-case
      "Case here"
            (check-true (aprox-equal? (expt (cube-root 2654) 3) 2654)))))


(run-tests tests 'verbose)

