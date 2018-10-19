#lang racket
#| Solution for exercise 2_84. |#

(require (only-in "../solutions/dispatch-table.rkt" type-tag contents get put get-coercion put-coercion))
(provide apply-generic-coercion)

(define (try-raise n)
  (let ((proc (get 'raise (type-tag n))))
    (if proc
      (proc n)
      false)))

(define (get-types args) (map type-tag args))
(define (get-contents args) (map contents args))

(define (higher-or-equal? a b)
  (cond ((not b) false)
        ((eq? (type-tag a) (type-tag b)) true)
        (else (higher-or-equal? a (try-raise b)))))

(define (raise-to-type type arg)
  (if (eq? (type-tag arg) type)
    arg
    (let ((raised-arg (try-raise arg)))
      (if raised-arg
        (raise-to-type type raised-arg)
        (error "cant raise to a such type")))))

(define (highest-type items)
  (if (null? (cdr items))
    (car items)
    (let ((a (car items))
          (b (highest-type (cdr items))))
      (if (higher-or-equal? a b)
         a
         b))))

(define (raise-all-to type items)
  (if (null? items)
    items
    (cons (raise-to-type type (car items)) (raise-all-to type (cdr items)))))


(define (apply-generic-coercion op . args)
  (let ((to-type (type-tag (highest-type args))))
    (let ((raised-args (raise-all-to to-type args)))
      (let ((proc (get op (get-types raised-args))))
        (if proc
          (apply proc (get-contents raised-args))
          (error "No method for these types"
                 (list op (type-tag args))))))))



