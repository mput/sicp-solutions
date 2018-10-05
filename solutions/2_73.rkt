#lang racket
#| Solution for exercise 2_73. |#
(require (only-in "../solutions/dispatch-table.rkt" put get))
(require (only-in "../solutions/2_56.rkt" =number? variable? same-variable?))

(provide deriv)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-deriv-rules)
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (define (deriv-product exp var)
    (make-sum
      (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))))

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

  (define (addend s) (car s))
  (define (augend s)
    (apply make-sum (cdr s)))


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

  (define (multiplier p) (car p))
  (define (multiplicand p)
    (apply make-product (cdr p)))

;; Add to dispatch table.
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  (put 'deriv 'make-product make-product)
  (put 'deriv 'make-sum make-sum))

(define (install-exponention-deriv-rule)
  (define make-product (get 'deriv 'make-product))
  (define (deriv-exponent exp var)
    (make-product
      (make-product
        (exponent exp)
        (make-exponent (base exp) (- (exponent exp) 1)))
      (deriv (base exp) var)))

  (define (make-exponent base exp)
    (cond ((=number? exp 0) 1)
          ((=number? exp 1) base)
          ((and (number? base) (number? exp)) (expt base exp))
          (else (list '** base exp))))

  (define (base x) (car x))
  (define (exponent x) (cadr x))

;; Add to dispatch table.
  (put 'deriv '** deriv-exponent))


(install-deriv-rules)
(install-exponention-deriv-rule)
