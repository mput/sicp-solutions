#lang racket

(require rackunit  rackunit/text-ui)

(require (only-in "../solutions/2_78.rkt" install-scheme-number-package install-rational-package install-complex-package))
(require (only-in "../solutions/dispatch-table.rkt" get put))
(require (only-in "../solutions/2_79.rkt" install-equ?-package))
(require (only-in "../solutions/2_81.rkt" install-coercion-package))
(require (only-in "../solutions/2_83.rkt" install-raise-package raise))
(require (only-in "../solutions/2_84.rkt" apply-generic-coercion))


(define (install-equ?-with-three-args-package)
  (define real-part (get 'real-part '(complex)))
  (define imag-part (get 'imag-part '(complex)))
  (define (equ? x y z) (apply-generic-coercion 'equ? x y z))
  (put 'equ? '(complex complex complex)
       (lambda (x y z)
         (and (equ? (real-part x) (real-part y) (real-part z))
              (equ? (imag-part x) (imag-part y) (imag-part z)))))
  (put 'equ? '(scheme-number scheme-number scheme-number)
       (lambda (x y z) (= x y z)))
  (define numer (get 'numer '(rational)))
  (define denom (get 'denom '(rational)))
  (put 'equ? '(rational rational rational)
       (lambda (x y z)
         (and (equ? (numer x) (numer y) (numer z))
              (equ? (denom x) (denom y) (denom z))))))

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-equ?-package)
(install-raise-package)
(install-equ?-with-three-args-package)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
(define (make-rational n d)
  ((get 'make 'rational) n d))

(define (equ? x y z) (apply-generic-coercion 'equ? x y z))
(define (add x y) (apply-generic-coercion 'add x y))

(define compl-num (make-complex-from-real-imag 3 0))
(define compl-num2 (make-complex-from-real-imag 4 0))
(define rat-num (make-rational 3 1))
(define rat-num2 (make-rational 3 2))

(define tests
  (test-suite
    "Test for exercise 2_82"
    (test-case
      "Test coersions three scheme-number->complex"
      (check-true (equ? 3 3 3))
      (check-true (equ? compl-num compl-num compl-num))
      (check-true (equ? compl-num 3 3))
      (check-true (equ? 3 compl-num 3)))
    (test-case
      "Falsy cases with three scheme-number->complex"
      (check-false (equ? 3 compl-num 4))
      (check-false (equ? 3 compl-num compl-num2))
      (check-false (equ? compl-num compl-num2 compl-num)))
    (test-case
      "With three different types"
      (check-true (equ? rat-num compl-num 3)))
    (test-case
      "Try add args"
      (check-equal? (add rat-num2 2) (make-rational 7 2)))))

(run-tests tests 'verbose)

