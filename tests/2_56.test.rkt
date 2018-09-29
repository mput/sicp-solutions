#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_56.rkt")


(define tests
  (test-suite
    "Test for exercise 2_56"
    (test-case
      "Examples from text"
      (check-equal? (deriv '(+ x 3) 'x)
                    1)
      (check-equal? (deriv '(* x y) 'x)
                    'y)
      (check-equal? (deriv '(* (* x y) (+ x 3)) 'x)
                    '(+ (* x y) (* y (+ x 3)))))
    (test-case
      "Exponent deriv"
      (check-equal? (deriv '(** x 2) 'x)
                    '(* 2 x))
      (check-equal? (deriv '(** x 3) 'x)
                    '(* 3 (** x 2))))))

(run-tests tests 'verbose)

