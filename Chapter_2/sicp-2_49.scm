#lang sicp
(#%require sicp-pict)

(define origin (make-vect 0 1))
(define vect1 (make-vect 1 0))
(define vect2 (make-vect 0 1))

(define frame1 (make-frame origin vect1 vect2))

(define one 0.99)

;;           x y            x y
(define vect_0-0 (make-vect 0 0))
(define vect_0-1 (make-vect 0 one))
(define vect_1-1 (make-vect one one))
(define vect_1-0 (make-vect one 0))


(define square-lines   (list  (make-segment vect_0-0 vect_0-1)
                              (make-segment vect_0-1 vect_1-1)
                              (make-segment vect_1-1 vect_1-0)
                              (make-segment vect_1-0 vect_0-0)))

(define x-lines (list (make-segment vect_0-0 vect_1-1)
                      (make-segment vect_0-1 vect_1-0)))
                               
(define (square-painter fr) ((segments->painter square-lines) fr))

(define (x-painter fr) ((segments->painter x-lines) fr))

(paint square-painter)
(paint x-painter)

