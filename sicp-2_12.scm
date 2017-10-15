#! /usr/local/bin/csi -s
(use sicp)



(define (make-interval a b) (cons a b))
(define (lower-bound int) (car int))
(define (upper-bound int) (cdr int))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-center-width c w) 
  (make-interval (- c w) (+ c w)))

(define (center int) 
  (/ 2 (- (upper-bound int) (lower-bound int))))

(define (width int) 
  (/ 2 (- (upper-bound int) (lower-bound int))))



(define first (make-interval 4.5 5.5))
(define second (make-interval 8 12))

(define first_2 (make-interval 0.5 2))
(define second_2 (make-interval -0.2 0.4))


(define mulint (mul-interval first second))
(print mulint)

(define mulint_2 (mul-interval first_2 second_2))
(print mulint_2)

