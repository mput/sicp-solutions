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
        (else
         (error "unknown expression type -- DERIV" exp))))


(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (sum? x)
  (define (has-sum? x)
    (cond ((null? x) #f)
          ((eq? (car x) '+) #t)
          (else (has-sum? (cdr x)))))
  (if (not (pair? x))
      #f
      (has-sum? x)))

(define (addend s)
  (define (helper s)
    (cond ((null? s) (error "Expression isn't a Sum"))
          ((eq? (car s) '+) '())
          (else (cons (car s) (helper (cdr s))))))
  (let ((pair-addend (helper s)))
       (if (null? (cdr pair-addend))
           (car pair-addend)
           pair-addend)))

(define (augend s)
  (cond ((null? s) (error "Expression isn't a Sum"))
        ((eq? (car s) '+) (if (null? (cddr s))
                              (cadr s)
                              (cdr s)))
        (else (augend (cdr s)))))




(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (product? x)
  (define (has-product? x)
    (cond ((null? x) #f)
          ((eq? (car x) '*) #t)
          (else (has-product? (cdr x)))))
  (if (not (pair? x))
      #f
      (has-product? x)))


(define (multiplier p)
  (define (helper s)
    (cond ((null? s) (error "Expression isn't a Product"))
          ((eq? (car s) '*) '())
          (else (cons (car s) (helper (cdr s))))))
  (let ((pair-addend (helper p)))
       (if (null? (cdr pair-addend))
           (car pair-addend)
           pair-addend)))

;; Another good cohice:
(define (multiplicand p) 
  (cond ((null? p) (error "Expression isn't a Product"))
        ((eq? (car p) '*) (if (null? (cddr p))
                              (cadr p)
                              (cdr p)))
        (else (multiplicand (cdr p)))))




(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
  
(define (=number? exp num)
  (and (number? exp) (= exp num)))



(print (deriv '(x + (3 * (x + (y + 2)))) 'x))
(print (deriv '(3 * (x + y + 2) + x) 'x))
