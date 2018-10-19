#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/dispatch-table.rkt" type-tag contents get put get-coercion put-coercion))
(require (only-in "../solutions/2_78.rkt" install-scheme-number-package install-rational-package install-complex-package))
(require (only-in "../solutions/2_83.rkt" install-raise-package raise))

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-raise-package)

(define (make-rational n d)
  ((get 'make 'rational) n d))

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))


(define tests
  (test-suite
    "Test for exercise 2_83"
    (test-case
      "Raise number up to complex"
      (define num 5)
      (define raiseed-to-complex-num (raise (raise num)))
      (define result (make-complex-from-real-imag (make-rational num 1) 0))
      (check-equal? raiseed-to-complex-num result))))

(run-tests tests 'verbose)

