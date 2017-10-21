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




(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))

(define new-frame (make-frame origin edge1 edge2))
(print (origin-frame new-frame))
(print (edge1-frame new-frame))
(print (edge2-frame new-frame))
(newline)


(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (cddr frame))

(define new-frame (make-frame origin edge1 edge2))
(print (origin-frame new-frame))
(print (edge1-frame new-frame))
(print (edge2-frame new-frame))
