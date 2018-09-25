#lang racket
#| Solution for exercise 2_45. |#

(require sicp-pict)

(define (split first-transformation second-transformation)
  (define (split-helper painter n)
    (if (= n 0)
      painter
      (let ((half (second-transformation (split-helper painter (- n 1)) (split-helper painter (- n 1)))))
        (first-transformation painter half))))
  split-helper)


(define rigth-split (split beside below))
(define up-split (split below beside))



(paint (rigth-split einstein 4))
(paint (up-split einstein 4))

