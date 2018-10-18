#lang racket
#| Solution for exercise 2_82. |#

(require (only-in "../solutions/dispatch-table.rkt" type-tag contents get put get-coercion put-coercion))
(provide apply-generic-coercion install-equ?-with-three-args-package)

(define (every? items)
  (cond ((null? items) true)
        ((not (car items)) false)
        (every? (cdr items))))

(define (try-coerce from-type to-type arg)
  (if (eq? from-type to-type)
    arg
    (let ((coersion (get-coercion from-type to-type)))
      (if coersion
        (coersion arg)
        false))))


(define (apply-generic op args)
  (let ((types (map type-tag args))
        (contents (map contents args)))
    (let ((proc (get op types)))
      (if proc
        (apply proc contents)
        false))))


(define (try-apply-with-coercion op args)
  (define (try-coerce-and-apply to-type-arg from-type-args)
    (let ((coercioned-args (map (lambda (from-arg) (try-coerce (type-tag from-arg) (type-tag to-type-arg) from-arg)) from-type-args)))
      (if (every? coercioned-args)
        (let ((applyed-proc (apply-generic op (cons to-type-arg coercioned-args))))
          (if applyed-proc
            applyed-proc
            false))
        false)))

  (define (helper tried not-tried)
    (if (null? not-tried)
      false
      (let ((to-type-arg (car not-tried))
            (from-type-args (append tried (cdr not-tried))))
        (let ((applyed-proc (try-coerce-and-apply to-type-arg from-type-args)))
          (if applyed-proc
            applyed-proc
            (helper (append tried (list to-type-arg)) (cdr not-tried)))))))
  (helper '() args))

(define (apply-generic-coercion op . args)
  (let ((applyed-without-coercion (apply-generic op args)))
    (if applyed-without-coercion
      applyed-without-coercion
      (let ((applyed-with-coercion (try-apply-with-coercion op args)))
        (if applyed-with-coercion
          applyed-with-coercion
          (error "No method for these types"
                 (list op args)))))))


(define (install-equ?-with-three-args-package)
  (define real-part (get 'real-part '(complex)))
  (define imag-part (get 'imag-part '(complex)))
  (define (equ? x y z) (apply-generic-coercion 'equ? x y z))
  (put 'equ? '(complex complex complex)
       (lambda (x y z)
         (and (equ? (real-part x) (real-part y) (real-part z))
              (equ? (imag-part x) (imag-part y) (imag-part z)))))
  (put 'equ? '(scheme-number scheme-number scheme-number)
       (lambda (x y z) (= x y z))))

