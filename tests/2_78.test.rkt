#lang racket

(require rackunit  rackunit/text-ui)
(require "./custom-checks.rkt")
(require (only-in "../solutions/2_78.rkt" add sub mul div make-rational make-complex-from-real-imag make-complex-from-mag-ang numer denom))
(require (only-in "../solutions/dispatch-table.rkt" apply-generic))


(define tests
  (test-suite
    "Test for exercise 2_78"
    (test-case
      "Schema numbers"
      (check-equal? (add 5 6) 11))
    (test-case
      "Test rational"
      (define rat-numb (add (make-rational 1 2) (make-rational 1 3)))
      (check-equal? (numer rat-numb) 5)
      (check-equal? (denom rat-numb) 6))
    (test-case
      "Test comlex"
      (define compl-num (make-complex-from-real-imag 3 2))
      (define compl-num2 (make-complex-from-real-imag 1 7))
      (define compl-multed (mul compl-num compl-num2))
      (define (real-part cmpl) (apply-generic 'real-part cmpl))
      (define (imag-part cmpl) (apply-generic 'imag-part cmpl))
      (check-close? (real-part compl-multed) -11 0.1)
      (check-close? (imag-part compl-multed) 23 0.1))))

(run-tests tests 'verbose)

