#lang racket
#| Solution for exercise 2_79. |#
(require "./2_78.rkt")
(require (only-in "../solutions/2_78.rkt" install-scheme-number-package install-rational-package install-complex-package))
(require (only-in "../solutions/dispatch-table.rkt" put get apply-generic))

(provide install-equ?-package)


(define (install-equ?-package)
  (define real-part (get 'real-part '(complex)))
  (define imag-part (get 'imag-part '(complex)))
  (define numer (get 'numer '(rational)))
  (define denom (get 'denom '(rational)))
  (define (equ? x y) (apply-generic 'equ? x y))
  (put 'equ? '(scheme-number scheme-number) =)
  (put 'equ? '(rational rational)
       (lambda (rat1 rat2)
         (and (equ? (numer rat1) (numer rat2))
              (equ? (denom rat1) (denom rat2)))))
  (put 'equ? '(complex complex)
       (lambda (x y)
         (and (equ? (real-part x) (real-part y))
              (equ? (imag-part x) (imag-part y)))))
  'install-equ?-package-done)

