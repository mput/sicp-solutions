#lang racket

(require rackunit "../solutions/dispatch-table.rkt")
(require rackunit/text-ui)

(define tests
  (test-suite
    "Test for exercise 2_57"
    (test-case
      "Dispatch table test"
      (put 'number 'square (lambda (x) (* x x)))
      (check-equal? ((get 'number 'square) 2) 4))
    (test-case
      "Dispatch table test with list tag"
      (put 'number '(square square) (lambda (x) (* x x)))
      (check-equal? ((get 'number '(square square)) 2) 4))))

(run-tests tests 'verbose)
