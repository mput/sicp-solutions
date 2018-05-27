#! /usr/local/bin/csi -s
(use sicp)

(define (make-vect x y) (cons x y))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))

(define (add-vect vect1 vect2)
  (make-vect (+ (xcor-vect vect1) (xcor-vect vect2))
             (+ (ycor-vect vect1) (ycor-vect vect2))))

(define (sub-vect vect1 vect2)
  (make-vect (- (xcor-vect vect1) (xcor-vect vect2))
             (- (ycor-vect vect1) (ycor-vect vect2))))

(define (scale-vect vect scalar)
  (make-vect (* (xcor-vect vect) scalar)
             (* (ycor-vect vect) scalar)))

(define vect1 (make-vect 0.2 0.5))
(define vect2 (make-vect 0.5 0.8))

(print (add-vect vect1 vect2))
(print (sub-vect vect1 vect2))
(print (scale-vect vect1 4))