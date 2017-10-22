#! /usr/local/bin/csi -s
(use sicp)

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
        ((exponentiation? exp)
         (make-product (make-product (exponent exp) (make-exponent (base exp) (decriment (exponent exp)))) (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))


;; representing algebraic expressions
;;(** u 5)
(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))

(define (base exp) (cadr exp))
(define (exponent exp) (caddr exp))

(define (make-exponent base exponent) 
    (cond ((=number? exponent 1) base)
          ((=number? exponent 0) 1)
          (else (list '** base exponent))))

(define (decriment x)
    (if (number? x)
        (- x 1)
        (list '- x 1)))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (make-sum (caddr s) (augend (append (list '*) (list (addend s)) (cdddr s))))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

;; Another good cohice:
(define (multiplicand p) 
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))



(print (deriv '(+ x 3) 'x))
(print (deriv '(* x y) 'x))
(print (deriv '(* (* x y) (+ x 3)) 'x))
(newline)
(print (deriv '(** x 5) 'x))
(print (deriv '(** x 3) 'x))
(print (deriv '(** x 2) 'x))
(print (deriv '(** x 1) 'x))
(newline)
(print (deriv '(** x y) 'x))
(print (deriv '(** (* 2 (** x 2)) (* 4 x)) 'x))
(newline)
(print (multiplicand '(* 2 3 4 5)))
(print (augend '(+ 1 2 3 4 6)))
(print (augend '(+ a b c d)))
(newline)
(print (deriv '(* (* x y) (+ x 3)) 'x))
(print (deriv '(* x y (+ x 3)) 'x))
(print (deriv '(+ x 3 4 (* 2 x 3)) 'x))
