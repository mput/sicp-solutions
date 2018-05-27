#lang sicp
(#%require sicp-pict)

(define (my-below painter1 painter2)
  (let ((bottom-frame (transform-painter (make-vect 0 0)
                                         (make-vect 1 0)
                                         (make-vect 0 0.5)))
        (top-frame (transform-painter (make-vect 0 0.5)
                                      (make-vect 1 0.5)
                                      (make-vect 0 1))))
      (lambda (frame)
        ((bottom-frame painter1) frame)
        ((top-frame painter2) frame))))

(define (my-below2 painter1 painter2)
  (rotate270 (beside (rotate90 painter1) (rotate90 painter2))))


;(paint einstein)
(paint (my-below einstein einstein))
(paint (my-below2 einstein einstein))

