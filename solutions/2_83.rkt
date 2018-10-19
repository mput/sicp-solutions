#lang racket
#| Solution for exercise 2_83. |#

(require (only-in "../solutions/dispatch-table.rkt" type-tag get put put-coercion))

(provide install-raise-package raise)

(define (install-raise-package)
  (define (make-rational n d)
    ((get 'make 'rational) n d))

  (define (make-complex-from-real-imag x y)
    ((get 'make-from-real-imag 'complex) x y))

  (define (raise->scheme-number n)
    (make-rational n 1))
  (define (raise->rational n)
    (make-complex-from-real-imag n 0))

  (put 'raise 'scheme-number raise->scheme-number)
  (put 'raise 'rational raise->rational)
  'install-raise-package-done)

(define (raise n)
  (let ((proc (get 'raise (type-tag n))))
    (if proc
      (proc n)
      (error "Cant raise type" (type-tag n)))))
