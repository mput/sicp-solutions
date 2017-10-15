#! /usr/local/bin/csi -s
(use sicp)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat a b)
  (let ((newa (if (and (or (< a 0) (< b 0)) (or (> a 0) (> b 0)))
                  (- (abs a))
                  (abs a)))
        (newb (abs b))
        (gcd-ab (abs (gcd a b))))
       (cons (/ newa gcd-ab) (/ (abs b) gcd-ab))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat a b) 
  (make-rat (+ (* (numer a) (denom b)) 
               (* (numer b) (denom a)))
            (* (denom a)(denom b))))
          
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
          
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))


(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (print-rat a) 
  (newline)
  (display (numer a))
  (display "/")
  (display (denom a)))
          

(print (abs -5))


(define one-fifth (make-rat 1 -5))
(define three-fifth (make-rat 3 10))

(print-rat (mul-rat one-fifth three-fifth))
(print-rat (add-rat one-fifth three-fifth))

