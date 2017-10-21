#lang sicp
(#%require sicp-pict)



(define (split origin splited)
  (define (splitter painter n) 
          (if (= n 0)
              painter
              (let ((small (splitter painter (- n 1))))
                (origin painter (splited small small)))))
  splitter)

(define right-split (split beside below))

(define up-split (split below beside))


(paint (right-split einstein 1))
(paint (up-split einstein 1))