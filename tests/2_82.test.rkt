#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/2_78.rkt" install-scheme-number-package install-rational-package install-complex-package))
(require (only-in "../solutions/dispatch-table.rkt" get put))
(require (only-in "../solutions/2_79.rkt" install-equ?-package))
(require (only-in "../solutions/2_81.rkt" install-coercion-package))
(require (only-in "../solutions/2_82.rkt" apply-generic-coercion install-equ?-with-three-args-package))

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-equ?-package)
(install-coercion-package)
(install-equ?-with-three-args-package)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))

(define (equ? x y z) (apply-generic-coercion 'equ? x y z))

(define tests
  (test-suite
    "Test for exercise 2_82"
    (test-case
      "Test coersions two scheme-number->complex"
      (define compl-num (make-complex-from-real-imag 3 0))
      (check-true (equ? 3 3 3))
      (check-true (equ? compl-num compl-num compl-num))
      (check-true (equ? compl-num 3 3))
      (check-true (equ? 3 compl-num 3))
      (check-true (equ? 3 compl-num compl-num)))))

(run-tests tests 'verbose)

