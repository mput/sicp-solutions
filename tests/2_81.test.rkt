#lang racket

(require rackunit  rackunit/text-ui)
(require (only-in "../solutions/2_78.rkt" install-scheme-number-package install-rational-package install-complex-package))
(require (only-in "../solutions/dispatch-table.rkt" get put))
(require (only-in "../solutions/2_79.rkt" install-equ?-package))
(require (only-in "../solutions/2_81.rkt" install-coercion-package apply-generic-coercion))

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)
(install-equ?-package)
(install-coercion-package)

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))

(define (add arg1 arg2) (apply-generic-coercion 'add arg1 arg2))
(define (equ? x y) (apply-generic-coercion 'equ? x y))
(define (exp x y) (apply-generic-coercion 'expt x y))

(define tests
  (test-suite
    "Test for exercise 2_78"
    (test-case
      "Schema numbers"
      (check-equal? (add 5 6) 11)
      (check-exn exn:fail? (lambda () (exp 3 2))))
    (test-case
      "Test comlex"
      (define compl-num (make-complex-from-real-imag 3 2))
      (equ? (add compl-num 3) (make-complex-from-real-imag 6 2)))))

(run-tests tests 'verbose)

