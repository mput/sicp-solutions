#! /usr/local/bin/csi -s
(use sicp)

(define (take-percent number perc) 
  (* number (/ perc 100)))

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

(define (width int) 
  (/ (- (upper-bound int) (lower-bound int)) 2))

(define (center int) 
  (/ (+ (upper-bound int) (lower-bound int)) 2))

(define (make-center-percent c p)
 (make-interval (- c (take-percent c p)) (+ c (take-percent c p))))

(define (percent int)
  (* 100 (/ (width int) (center int))))

(define int-perc (make-center-percent 15 2)) 

(print int-perc)
(print (center int-perc))
(print (percent int-perc))
