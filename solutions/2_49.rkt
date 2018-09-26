#lang racket
#| Solution for exercise 2_49. |#

(require sicp-pict)

(define (circuit-from-vectors vectors)
  (if (null? (cdr vectors))
    '()
    (cons (make-segment (car vectors) (cadr vectors)) (circuit-from-vectors (cdr vectors)))))



(define frame
  (segments->painter (circuit-from-vectors
                       (list
                         (make-vect 0 0)
                         (make-vect 0 .99)
                         (make-vect .99 .99)
                         (make-vect .99 0)
                         (make-vect 0 0)))))

(define x
  (segments->painter (list
                       (make-segment (make-vect 0 0) (make-vect 1 1))
                       (make-segment (make-vect 0 1) (make-vect 1 0)))))
(define rhombus
  (segments->painter (circuit-from-vectors
                       (list
                         (make-vect 0.5 0)
                         (make-vect 1 0.5)
                         (make-vect 0.5 1)
                         (make-vect 0 0.5)
                         (make-vect 0.5 0)))))

(define (wave frame)
  ((segments->painter (append (circuit-from-vectors
                                (list (make-vect 0.4  0.0)
                                      (make-vect 0.5  0.33)
                                      (make-vect 0.6  0.0) ;inside legs
                                      (make-vect 0.6  0.0))) ;inside legs
                              (circuit-from-vectors
                                (list (make-vect 0.25 0.0)
                                      (make-vect 0.33 0.5)
                                      (make-vect 0.3  0.6)
                                      (make-vect 0.1  0.4)
                                      (make-vect 0.0  0.6))) ;lower left
                              (circuit-from-vectors
                                (list (make-vect 0.0  0.8)
                                      (make-vect 0.1  0.6)
                                      (make-vect 0.33 0.65)
                                      (make-vect 0.4  0.65)
                                      (make-vect 0.35 0.8)
                                      (make-vect 0.4  1.0))) ;upper left
                              (circuit-from-vectors
                                (list (make-vect 0.75 0.0)
                                      (make-vect 0.6  0.45)
                                      (make-vect 1.0  0.15)));lower right
                              (circuit-from-vectors
                                (list (make-vect 1.0  0.35)
                                      (make-vect 0.8  0.65)
                                      (make-vect 0.6  0.65)
                                      (make-vect 0.65 0.8)
                                      (make-vect 0.6  1.0)))));upper right
   frame))


(paint frame)
(paint x)
(paint rhombus)
(paint wave)
