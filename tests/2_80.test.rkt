#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/2_78.rkt" add sub mul div make-rational make-complex-from-real-imag make-complex-from-mag-ang numer denom))
(require (only-in "../solutions/2_80.rkt" =zero?))


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

