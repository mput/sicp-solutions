#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/2_73.rkt" deriv))


(define tests
  (test-suite
    "Test for exercise 2_73"
    (test-case
      "Sum deriv tests"
      (check-equal? (deriv '(+ x 1) 'x)
                    1)
      (check-equal? (deriv '(+ x 1 2) 'x)
                    1)
      (check-equal? (deriv '(+ x 1 2 (+ 2 x)) 'x)
                    2))
    (test-case
      "Product deriv tests"
      (check-equal? (deriv '(* x 1) 'x)
                    1)
      (check-equal? (deriv '(* x y) 'x)
                    'y)
      (check-equal? (deriv '(* x y (+ x 3)) 'x)
                    '(+ (* x y) (* y (+ x 3)))))
    (test-case
      "Exponent deriv tests"
      (check-equal? (deriv '(** x 2) 'x)
                    '(* 2 x)))))


(run-tests tests 'verbose)
