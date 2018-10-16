#lang racket
#| Solution for exercise 2_80. |#

(require "./2_78.rkt")
(require (only-in "../solutions/dispatch-table.rkt" put get attach-tag type-tag contents apply-generic))
(provide install-=zero?-package)


(define (install-=zero?-package)
  (define (=zero? x) (apply-generic '=zero? x))
  (put '=zero? '(scheme-number) (lambda (x) (= x 0)))
  (define (make-complex-from-real-imag x y)
    ((get 'make-from-real-imag 'complex) x y))

  (define numer (get 'numer '(rational)))
  (put '=zero? '(rational) (lambda (rat) (=zero? (numer rat))))

  (define real-part (get 'real-part '(complex)))
  (define imag-part (get 'imag-part '(complex)))
  (put '=zero? '(complex)
       (lambda (x)
         (and (=zero? (real-part x))
              (=zero? (imag-part x)))))
  'install-=zero?-package-done)
