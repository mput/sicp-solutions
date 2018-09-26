#lang racket
#| Solution for exercise 2_46. |#

(require rackunit "../solutions/utils.rkt")
(provide make-vect xcor-vect ycor-vect add-vect sub-vect scale-vect)

(define (make-vect x y) (cons x y))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))

(define (add-vect vect-a vect-b)
  (make-vect (+ (xcor-vect vect-a) (xcor-vect vect-b))
             (+ (ycor-vect vect-a) (ycor-vect vect-b))))

(define (sub-vect vect-a vect-b)
  (make-vect (- (xcor-vect vect-a) (xcor-vect vect-b))
             (- (ycor-vect vect-a) (ycor-vect vect-b))))

(define (scale-vect s vect)
  (make-vect (* s (xcor-vect vect))
             (* s (ycor-vect vect))))

