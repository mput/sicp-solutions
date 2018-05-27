#! /usr/local/bin/csi -s
(use sicp)



(define (make-interval a b) (cons a b))
(define (lower-bound int) (car int))
(define (upper-bound int) (cdr int))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define first (make-interval 4.5 5.5))
(define second (make-interval 8 12))


(print first)
(define sumint (add-interval first second))
(print sumint)
