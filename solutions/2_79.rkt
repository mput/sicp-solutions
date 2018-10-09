#lang racket
#| Solution for exercise 2_79. |#
(require "./2_78.rkt")
(require (only-in "../solutions/dispatch-table.rkt" put get attach-tag type-tag contents apply-generic))
(require (only-in "./complex-number-package.rkt" real-part imag-part))
(provide equ?)


(define (install-scheme-number-equ?)
  (put 'equ? '(scheme-number scheme-number) =)
  'install-scheme-number-equ?-done)

(define (install-rational-equ?)
  (define numer (get 'numer '(rational)))
  (define denom (get 'denom '(rational)))
  (put 'equ? '(rational rational)
       (lambda (rat1 rat2)
         (and (equ? (numer rat1) (numer rat2))
              (equ? (denom rat1) (denom rat2)))))
  'install-rational-equ?-done)

(define (install-complex-equ?)
  (put 'equ? '(complex complex)
       (lambda (x y)
         (and (equ? (real-part x) (real-part y))
              (equ? (imag-part x) (imag-part y))))))


(install-scheme-number-equ?)
(install-rational-equ?)
(install-complex-equ?)

(define (equ? x y) (apply-generic 'equ? x y))
