#lang racket
#| Solution for exercise 2_47. |#

(require rackunit "../solutions/utils.rkt")
(require rackunit "./2_46.rkt")

(provide make-frame origin-frame edge1-frame edge2-frame frame-coord-map)

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))


(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
                (scale-vect (ycor-vect v) (edge2-frame frame))))))
