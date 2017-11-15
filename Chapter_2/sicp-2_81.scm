#! /usr/local/bin/csi -s
(use sicp)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (equal? type1 type2)
                    (error "No method for these types!!!")
                    (let ((t1->t2 (get-coercion type1 type2))
                          (t2->t1 (get-coercion type2 type1)))
                      (cond ((t1->t2
                              (apply-generic op (t1->t2 a1) a2)))
                            ((t2->t1
                              (apply-generic op a1 (t2->t1 a2))))
                            (else
                              (error "No method for these types"
                                    (list op type-tags)))))))
              (error "No method for these types"
                  (list op type-tags)))))))

(load "sicp-2_79.scm")

(define (exp x y) (apply-generic 'exp x y))

(put 'exp '(scheme-number scheme-number)
    (lambda (x y) (tag (expt x y))))

(define (tests)
    (define second-rat (make-rational 3 5))
    (define third-rat (make-rational 4 10))
    (print (exp third-rat second-rat) " False"))

(tests)