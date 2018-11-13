#lang sicp

(#%require rackunit  rackunit/text-ui)
(#%require "../solutions/constraints.rkt")
(#%require "../solutions/3_35.rkt")


(define tests
  (test-suite
    "Test for exercise 3_33"
    (test-case
      "Case here"
      (define a (make-connector))
      (define b (make-connector))
      (squarer a b)
      (probe 'a a)
      (probe 'b b)

      (set-value! a 6 'user)
      (check-equal? (get-value b) 36)
      (forget-value! a 'user)
      (set-value! b 64 'user)
      (check-equal? (get-value a) 8))))

(run-tests tests 'verbose)

