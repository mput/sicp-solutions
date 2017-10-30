#! /usr/local/bin/csi -s
(use sicp)

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))


(define (install-deriv-package)
  (define (first-arg oper) (car oper))
  (define (second-arg oper) (cadr oper))

  (define (deriv-product operands exp)
        (make-sum
              (make-product (first-arg operands)
                            (deriv (second-arg operands) exp))
              (make-product (deriv (first-arg operands) exp)
                            (second-arg operands))))

  (define (deriv-sum operands exp)
          (make-sum (deriv (first-arg operands) exp)
                    (deriv (second-arg operands) exp)))

  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product))
 
(define (instal-exp-packade)
  (define (make-exponent base exponent) 
    (cond ((=number? exponent 1) base)
          ((=number? exponent 0) 1)
          (else (list '** base exponent))))
  (define (decriment x)
    (if (number? x)
        (- x 1)
        (list '- x 1)))
  (put 'deriv '** 
    (lambda (operands var) 
            (make-product 
              (make-product (cadr operands)
                            (make-exponent (car operands) (decriment (cadr operands)))) 
              (deriv (car operands) var)))))

(install-deriv-package)
(instal-exp-packade)
(print (deriv '(+ x 3) 'x))
(print (deriv '(* (* x y) (+ x 3)) 'x))
(print (deriv '(** x 5) 'x))