#lang sicp
(#%require sicp-pict)

(define (flip-horiz painter)
  ((transform-painter (make-vect 1 0)
                      (make-vect 0 0)
                      (make-vect 1 1)) painter))

(define (my-rotate-180 painter)
  ((transform-painter (make-vect 1 1)
                      (make-vect 0 1)
                      (make-vect 1 0)) painter))

(define (rotate-270 painter)
  ((transform-painter (make-vect 0 1)
                      (make-vect 0 0)
                      (make-vect 1 1)) painter))


(paint einstein)
;(paint (flip-horiz einstein))
(paint (my-rotate-180 einstein))
(paint (rotate-270 einstein))
