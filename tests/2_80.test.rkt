#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/2_78.rkt" install-scheme-number-package install-rational-package install-complex-package))
(require (only-in "../solutions/2_80.rkt" install-=zero?-package))
(require (only-in "../solutions/dispatch-table.rkt" put get apply-generic))

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-=zero?-package)

(define (=zero? x) (apply-generic '=zero? x))
(define (make-rational n d)
  ((get 'make 'rational) n d))
(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))

(define tests
  (test-suite
    "Test for exercise 2_79"
    (check-true (=zero?  0))
    (check-false (=zero?  1))
    (check-true (=zero? (make-rational 0 2)))
    (check-false (=zero? (make-rational 2 2)))
    (check-true (=zero? (make-complex-from-real-imag 0 0)))
    (check-false (=zero? (make-complex-from-real-imag 1 0)))))

(run-tests tests 'verbose)

