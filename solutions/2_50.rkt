#lang racket
#| Solution for exercise 2_50. |#

(require sicp-pict)


(define (flip-horiz painter)
  ((transform-painter (make-vect 1 0)
                      (make-vect 0 0)
                      (make-vect 1 1))
   painter))

(paint (flip-horiz einstein))
