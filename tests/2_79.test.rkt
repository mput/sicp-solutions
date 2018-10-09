#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/2_78.rkt" add sub mul div make-rational make-complex-from-real-imag make-complex-from-mag-ang numer denom))
(require (only-in "../solutions/2_79.rkt" equ?))


(define tests
  (test-suite
    "Test for exercise 2_79"
    (check-true (equ?  1 1))
    (check-false (equ?  1 2))
    (check-true (equ? (make-rational 1 2) (make-rational 2 4)))
    (check-false (equ? (make-rational 3 2) (make-rational 2 4)))
    (check-true (equ? (make-complex-from-real-imag 2 10) (make-complex-from-real-imag 2 10)))
    (check-false (equ? (make-complex-from-real-imag 2 11) (make-complex-from-real-imag 2 10)))))

(run-tests tests 'verbose)

