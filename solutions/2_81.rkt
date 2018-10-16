#lang racket
#| Solution for exercise 2_81. |#

(require (only-in "../solutions/dispatch-table.rkt" type-tag contents get put get-coercion put-coercion))
(provide apply-generic-coercion install-coercion-package)

(define (apply-generic-coercion op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (and (= (length args) 2) (not (eq? (car type-tags) (cadr type-tags))))
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (cond (t1->t2
                         (apply-generic-coercion op (t1->t2 a1) a2))
                        (t2->t1
                         (apply-generic-coercion op a1 (t2->t1 a2)))
                        (else
                         (error "No method for these types"
                                (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))



(define (install-coercion-package)
  (define (scheme-number->complex n)
    (define (make-complex-from-real-imag x y)
      ((get 'make-from-real-imag 'complex) x y))
    (make-complex-from-real-imag (contents n) 0))

  (put-coercion 'scheme-number 'complex scheme-number->complex)
  'install-coercion-package-done)

