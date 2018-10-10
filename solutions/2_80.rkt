#lang racket
#| Solution for exercise 2_80. |#

(require "./2_78.rkt")
(require (only-in "../solutions/dispatch-table.rkt" put get attach-tag type-tag contents apply-generic))
(require (only-in "./complex-number-package.rkt" real-part imag-part))
(provide =zero?)


(define (install-=zero?-package)
  (put '=zero? '(scheme-number) (lambda (x) (= x 0)))

  (define numer (get 'numer '(rational)))
  (put '=zero? '(rational) (lambda (rat) (=zero? (numer rat))))

  (put '=zero? '(complex)
       (lambda (x)
         (and (=zero? (real-part x))
              (=zero? (imag-part x)))))
  'install-=zero?-package-done)

(install-=zero?-package)
(define (=zero? x) (apply-generic '=zero? x))

