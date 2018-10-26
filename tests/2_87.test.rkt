#lang racket

(require rackunit  rackunit/text-ui)

(require (only-in "../solutions/2_78.rkt" install-scheme-number-package install-rational-package install-complex-package))
(require (only-in "../solutions/dispatch-table.rkt" get put))
(require (only-in "../solutions/2_79.rkt" install-equ?-package))
(require (only-in "../solutions/2_80.rkt" install-=zero?-package))
(require (only-in "../solutions/2_81.rkt" install-coercion-package))
(require (only-in "../solutions/2_83.rkt" install-raise-package))
(require (only-in "../solutions/2_84.rkt" apply-generic-coercion))
(require (only-in "../solutions/2_87.rkt" install-polynomial-package make-term))

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-equ?-package)
(install-raise-package)
(install-=zero?-package)
(install-polynomial-package)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
(define (make-rational n d)
  ((get 'make 'rational) n d))
(define (make-polynomial var terms)
  ((get 'make 'polynomial) var terms))

(define (equ? x y) (apply-generic-coercion 'equ? x y))
(define (add x y) (apply-generic-coercion 'add x y))
(define (mul x y) (apply-generic-coercion 'mul x y))

(define first-polynom (make-polynomial 'x (list (make-term 2 1) (make-term 0 2))))
(define second-polynom (make-polynomial 'x (list (make-term 2 2) (make-term 1 4))))

(define tests
  (test-suite
    "Test for exercise 2_87"
    (test-case
      "Addition of polinoms"
      (define sum-polinoms (add first-polynom second-polynom))
      (define should-be (make-polynomial 'x (list (make-term 2 3) (make-term 1 4) (make-term 0 2))))
      (check-equal? sum-polinoms should-be))
    (test-case
      "Multiplication of polinoms"
      (define mul-polinoms (mul first-polynom second-polynom))
      (define should-be (make-polynomial 'x (list (make-term 4 2) (make-term 3 4) (make-term 2 4) (make-term 1 8))))
      (check-equal? mul-polinoms should-be))
    (test-case
      "Multiplication of polinoms with polynom coef"
      (define y-first-pol (make-polynomial 'y (list (make-term 2 1))))
      (define y-second-pol (make-polynomial 'y (list (make-term 1 1))))
      (define x-first-pol (make-polynomial 'x (list (make-term 2 y-first-pol))))
      (define x-second-pol (make-polynomial 'x (list (make-term 2 y-second-pol))))

      (define add-polinoms (add x-first-pol x-second-pol))
      (define should-be-add (make-polynomial 'x (list (make-term 2 (make-polynomial 'y (list (make-term 2 1) (make-term 1 1)))))))

      (check-equal? add-polinoms should-be-add))))

(run-tests tests 'verbose)

