#lang racket
#| Solution for exercise 2_57. |#

(require rackunit "./2_56.rkt")
(provide deriv make-sum make-product)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponention? exp)
         (make-product
           (make-product
             (exponent exp)
             (make-exponent (base exp) (- (exponent exp) 1)))
           (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))
;; Sum
(define (make-sum . args)
  (let ((addendums-number-sum (foldr + 0
                                     (filter
                                       (lambda (arg) (number? arg))
                                       args)))
        (addendums-rest (filter
                          (lambda (arg) (not (number? arg)))
                          args)))
    (cond ((null? addendums-rest) addendums-number-sum)
          ((and (= addendums-number-sum 0) (null? (cdr addendums-rest))) (car addendums-rest))
          (else (if (= 0 addendums-number-sum)
                  (append (list '+) addendums-rest)
                  (append (list '+ addendums-number-sum) addendums-rest))))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s)
  (apply make-sum (cddr s)))

;; Product

(define (make-product . args)
  (let ((multiplier-number-product (foldr * 1
                                          (filter
                                            (lambda (arg) (number? arg))
                                            args)))
        (multipliers-rest (filter
                            (lambda (arg) (not (number? arg)))
                            args)))
    (cond ((= multiplier-number-product 0) 0)
          ((null? multipliers-rest) multiplier-number-product)
          ((and (= multiplier-number-product 1) (null? (cdr multipliers-rest))) (car multipliers-rest))
          (else (if (= 1 multiplier-number-product)
                  (append (list '*) multipliers-rest)
                  (append (list '* multiplier-number-product) multipliers-rest))))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p)
  (apply make-product (cddr p)))
