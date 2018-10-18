#lang racket
#| Solution for exercise 2_82. |#

(require (only-in "../solutions/dispatch-table.rkt" type-tag contents get put get-coercion put-coercion))
(provide apply-generic-coercion)

(define (every? items)
  (cond ((null? items) true)
        ((not (car items)) false)
        (else (every? (cdr items)))))

(define (get-types args) (map type-tag args))
(define (get-contents args) (map contents args))

(define (try-coerce arg to-type)
  (let ((from-type (type-tag arg)))
    (if (eq? from-type to-type)
      arg
      (let ((coersion (get-coercion from-type to-type)))
        (if coersion
          (coersion arg)
          false)))))

(define (apply-generic-coercion op . args)
  (define (try-coerce-apply-to-first rest-args)
    (if (null? rest-args)
      (error "No method for these types"
             (list op (type-tag args)))
      (let ((to-type (type-tag (car rest-args))))
        (let ((coerced (map (lambda (arg) (try-coerce arg to-type)) args)))
          (if (every? coerced)
            (let ((proc (get op (get-types coerced))))
              (if proc
                (apply proc (get-contents coerced))
                (try-coerce-apply-to-first (cdr rest-args))))
            (try-coerce-apply-to-first (cdr rest-args)))))))
  (try-coerce-apply-to-first args))



