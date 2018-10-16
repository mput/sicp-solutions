#lang racket

(require rackunit  rackunit/text-ui)
(require "./custom-checks.rkt")
(require (only-in "../solutions/2_78.rkt" install-scheme-number-package install-rational-package install-complex-package))
(require (only-in "../solutions/dispatch-table.rkt" apply-generic get put))


(install-scheme-number-package)
(install-rational-package)
(install-complex-package)

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (make-rational n d)
  ((get 'make 'rational) n d))
(define (numer rat) (apply-generic 'numer rat))
(define (denom rat) (apply-generic 'denom rat))

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))


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

