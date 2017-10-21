#! /usr/local/bin/csi -s
(use sicp)

;; Exc 2_46
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

(define origin (make-vect 0.5 0.5))
(define edge1 (make-vect 0.2 0.4))
(define edge2 (make-vect 0.4 0.2))
;;

(define (make-segment start-vector end-vector) (cons start-vector end-vector))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))