#lang sicp
(#%require sicp)

(define (stream-car x) (car x))
(define (stream-cdr x) (force (cdr x)))

#| Solution for exercise 3_51. |#

(define (stream-enumerate-interval min max)
  (if (> min max)
    the-empty-stream
    (cons-stream
      min
      (stream-enumerate-interval (+ min 1) max))))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc stream)
  (if (stream-null? stream)
    stream
    (cons-stream
      (proc (stream-car stream))
      (stream-map proc (stream-cdr stream)))))


(define (show x)
  (display x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))

(stream-ref x 5)
(stream-ref x 7)
(stream-ref x 2)
(stream-ref x 9)
