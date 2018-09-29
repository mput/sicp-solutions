#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_57.rkt")



(define tests
  (test-suite
    "Test for exercise 2_57"
    (test-case
      "Make sum tests"
      (check-equal? (make-sum 1 2 3 4)
                    10)
      (check-equal? (make-sum 1 2 3 4 'x)
                    '(+ 10 x))
      (check-equal? (make-sum 'x 1 2 3 'x)
                    '(+ 6 x x))
      (check-equal? (make-sum 1 2 '(+ x 4) 3 'x)
                    '(+ 6 (+ x 4) x))
      (check-equal? (make-sum '(+ x 4) 0 'x)
                    '(+ (+ x 4) x)))
    (test-case
      "Make product tests"
      (check-equal? (make-product 1 2 3)
                    6)
      (check-equal? (make-product 1 2 3 4 'x)
                    '(* 24 x))
      (check-equal? (make-product 'x 1 2 3 'x)
                    '(* 6 x x))
      (check-equal? (make-product 2 2 '(+ x 4) 3 'x)
                    '(* 12 (+ x 4) x)))
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
                    '(+ (* x y) (* y (+ x 3)))))))


(run-tests tests 'verbose)


