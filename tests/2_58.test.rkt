#lang racket

(require rackunit/text-ui)
(require rackunit "custom-checks.rkt")
(require rackunit "../solutions/2_58.rkt")


(define tests
  (test-suite
    "Test for exercise 2_58"
    (test-case
      "Sum deriv tests"
      (check-equal? (deriv '(x + 1) 'x)
                    1)
      (check-equal? (deriv '(x + (1 + 2)) 'x)
                    1)
      (check-equal? (deriv '(x + (2 + x)) 'x)
                    2))
    (test-case
      "Product deriv tests"
      (check-equal? (deriv '(x * 1) 'x)
                    1)
      (check-equal? (deriv '(x * y) 'x)
                    'y)
      (check-equal? (deriv '(x * (y * (x + 3))) 'x)
                    '((x * y) + (y * (x + 3)))))))

(run-tests tests 'verbose)

